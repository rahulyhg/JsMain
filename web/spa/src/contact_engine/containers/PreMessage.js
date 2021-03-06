require ('../style/contact.css')
import React from "react";
import { commonApiCall } from "../../common/components/ApiResponseHandler";
import * as CONSTANTS from '../../common/constants/apiConstants';
import Loader from "../../common/components/Loader";

export default class PreMessage extends React.Component{
  constructor(props){
    super(props);
      let lastSent = this.props.buttonData.actiondetails ?(this.props.buttonData.actiondetails.lastsent ? this.props.buttonData.actiondetails.lastsent : "") : "";
      this.state = {
        showLoader: false,
        tupleDim : {'width' : window.innerWidth,'height': window.innerHeight},
        nxtdata: this.props.buttonData.hasNext,
        messages : this.props.buttonData.messages ? this.props.buttonData.messages :[] ,
        writeMessageText : lastSent,
        lastMsgID : this.props.buttonData.MSGID,
        lastChatID : this.props.buttonData.CHATID,
        screenChange:false,
        sendAllow:true
    };

        this.WrieMsgScrollEvent = this.WrieMsgScrollEvent.bind(this);

  }


  componentDidMount()
  {

    this.setPreMsgDim();
  }

  componentDidUpdate()
  {
    document.getElementById('msgId').scrollTop = document.getElementById('msgId').scrollHeight-(this.scrollHeight);
  }

  setPreMsgDim()
  {

    let e = document.getElementById('msgId');
    let topHeadHgt, bottomBtnHeight,remHgtMSG,errNotSendHgt=0;
    topHeadHgt = document.getElementById('comm_headerMsg').clientHeight;
    if(document.getElementById('comm_footerMsg')!=null)
    {
      bottomBtnHeight =document.getElementById('comm_footerMsg').clientHeight;
    }
    else
    {
      bottomBtnHeight =document.getElementById('parentFootId').clientHeight;
    }
    if(document.getElementById('errMsgP')!=null)
    {
      errNotSendHgt = document.getElementById('errMsgP').clientHeight;
    }

    //Note:this will take the scroll to the bottom of the msg inner view, where prvious msh are being displayes
    remHgtMSG = window.innerHeight - (topHeadHgt+bottomBtnHeight+errNotSendHgt);
    e.style.height = remHgtMSG+"px";
    if( remHgtMSG < e.scrollHeight)
    {
      setTimeout(function(E){E.scrollTop =  E.scrollHeight; }, 100, e);
    }
  }

  showLoaderDiv() {
        this.setState({
            showLoader:true
        });

  }

  hideMessageLayer() {

    this.props.closeMessageLayer();
  }

  randomstringGen(len)
  {
    let text = " ";
    let charset = "abcdefghijklmnopqrstuvwxyz0123456789";
    for( let i=0; i < len; i++ )
        text += charset.charAt(Math.floor(Math.random() * charset.length));
    return text;
  }


  sendMessage() {

    if(this.state.sendAllow==false)return;
    let message = document.getElementById("writeMessageTxtId").value.trim();
    if(message=='')return;
    this.showLoaderDiv();
    var e = document.getElementById('msgId');
    document.getElementById("writeMessageTxtId").value = "";
    var st = (this.props.sTypeVar?this.props.sTypeVar:"");
    var url = '?&'+st+'&profilechecksum='+this.props.profilechecksum+(this.props.fromEOI ? this.props.buttonData.actiondetails.writemsgbutton.params :"");
    var _this=this, api = this.props.fromEOI ? '/api/v1/contacts/MessageHandle' : '/api/v1/chat/sendEOI' ;
    this.dontCall=1;


    //let pS = this.props.psource;
    let pS = 'chat';

    commonApiCall(api+url,{chatMessage:message ,pageSource:pS,channel: 'JSMS' },'','').then((response)=>{
      if(response.buttondetails.sent==true || response.sent==true)
      {
        let messages = _this.state.messages.concat({mymessage:'true',message:message,timeTxt:'Message Sent' }) ;
        _this.setState({
          showLoader:false,
          showCloseLayer: this.props.fromEOI ? true : false,
          messages : messages
        });
        e.scrollTop =  e.scrollHeight;
        setTimeout(()=>{_this.dontCall=0;},2500);
      }
      else
      {
        _this.setState({
          showLoader:false,
          screenChange:true,
          sendAllow:false,
          errorMsg: response.errorMsg
        },()=>{
          _this.setPreMsgDim();
        })
      }

      // (this.props.listingId)
      //   this.props.updateLastSeenMsg(message);
      });
    }

  showMessagesOnScroll(e)
  {
    if(!this.state.nxtdata)return;
    this.showLoaderDiv();
    var url = `?&profilechecksum=${this.props.profilechecksum}&MSGID=${this.state.lastMsgID ? this.state.lastMsgID:""}&CHATID=${this.state.lastChatID ? this.state.lastChatID:""}&pagination=1`;
    commonApiCall('/api/v2/contacts/WriteMessage'+url,{},'WRITE_MESSAGE','POST').then((response)=>{
      this.scrollHeight = document.getElementById('msgId').scrollHeight;
      let messages = response.messages.concat(this.state.messages);
      this.setState({
        nxtdata:response.hasNext,
        messages:messages,
        lastMsgID : response.MSGID,
        lastChatID : response.CHATID,
        showLoader:false,
      });
    });
  }

  WrieMsgScrollEvent()
  {
    if(this.dontCall==1)return;
    let e = document.getElementById('msgId');

    if(e.scrollTop==0)
    {

     this.showMessagesOnScroll(e);
    }
  }
  getWriteMsg_topView()
  {
   return (<div className="posrel clearfix fontthin ce_hgt1">
      <div className="posabs com_left1">
        <img id="imageId" src={this.props.fromEOI ? this.props.buttonData.buttondetails.photo.url : this.props.buttonData.viewed} className="com_brdr_radsrp ce_dim1"/>
      </div>
      <div className="posabs com_right1">
        <i className="mainsp com_cross" onClick={this.props.closeWriteMsgLayer}></i>
      </div>
      <div className="txtc f19 white pt10" id="usernameId">{this.props.username}</div>
    </div>);
  }

  getPreMsg_cannotSend()
  {

    let cannotView='';

    if(this.state.screenChange)
    {
      cannotView = <div className="fontlig f16 white txtc pad12" id="errMsgP">
                    {this.state.errorMsg}
                  </div>;



    }

    return cannotView;
  }

  getWriteMsg_innerView()
  {
    let WriteMsg_innerView, WrtieMsg_historydiv,WriteMsg_appendmsg;
            if(this.props.buttonData.cansend == 'false' && !this.props.fromEOI)
            {
              WriteMsg_innerView = (<div className="fullwid white dispbl freeMsgDiv ce_pt1" id="freeMsgId">
                  Become a paid member to connect further
              </div>);
            }
            else
            {

              if(this.state.messages.length)
              {
                WrtieMsg_historydiv =  this.state.messages.map((msg,index)=>{
                                        let msg_class1;
                                        if(msg.mymessage == 'true')
                                        {
                                          msg_class1 = "txtr ce_pad_l";
                                        }
                                        else
                                        {
                                          msg_class1 = "txtl ce_pad_2";
                                        }

                                        return(
                                            <div className={"fontlig f16 white srfrm_wrap "+ msg_class1} id={"msg_"+index} key={index}>
                                              <span dangerouslySetInnerHTML={{__html: msg.message.replace(/\n/g,"<br />")}}></span>
                                              <span className="dispbl f12 color1 pt5">{msg.timeTxt}</span>
                                            </div>
                                        );
                                      });

            }
            else {
              WrtieMsg_historydiv = <div className="com_pad1_new fontlig f16 white" id="presetMessageDispId" key="nomsg">
                <div id="presetMessageTxtId" className="txtc">{this.props.fromEOI ? this.props.buttonData.actiondetails.draftmessage : "Sending a message to this user will also send them your interest"}</div>
               <span className="dispbl f12 color1 pt5 white" id="presetMessageStatusId"></span>
              </div>

            }
            WriteMsg_innerView=WrtieMsg_historydiv;
          }

    return WriteMsg_innerView;
  }

  getWriteMsg_buttonView()
  {
    let WriteMsg_buttonView;

    if(this.state.showCloseLayer){
      return (<div className="posfix btmo fullwid" id="crossButId">
                  <div className="dispbl brdr22 white txtc f16 pad2 fontlig" id="closeLayer" onClick={this.props.closeWriteMsgLayer}>Close</div>
                </div>);
    }

    if(this.props.buttonData.cansend == 'false' && !this.props.fromEOI)
    {

      let offertextHTML='',buttonHTML='';

      if(this.props.buttonData.button.text!=null)
      {
         offertextHTML = (
                          <div className="white color2 ce_hgt2 brdr23_contact" key="PD_offer_text" id="CEmembershipMessage2">
                          {this.props.buttonData.button.text}
                         </div>
                        );
      }
      buttonHTML = <a href="/profile/mem_comparison.php" id="memTxtId" key="PD_mem_label" className="fullwid">
              <div className="fullwid bg7 txtc pad5new posrel lh40">
                  <div className="wid60p">
                      <div className="white">  {this.props.buttonData.button.label}</div>
                  </div>
              </div>
            </a>

      WriteMsg_buttonView = [offertextHTML,buttonHTML];
    }
    else WriteMsg_buttonView = (<div className="fullwid posfix clearfix brdr23_contact btmsend txtAr_bg1  btm0" id="comm_footerMsg">
                            <div className="fl wid80p com_pad3">
                              <textarea  id="writeMessageTxtId" defaultValue = {this.state.writeMessageText} className="fullwid lh15 inp_1 white hgt45"></textarea>
                            </div>
                            <div onClick={() => this.sendMessage()} className="fr com_pad4">
                              <div className="color2 f16 fontlig">Send</div>
                            </div>
                          </div>);
    return WriteMsg_buttonView;
  }
  render(){

  let loaderView;
        if(this.state.showLoader)
        {
          loaderView = <Loader show="writeMessageComp"  loaderStyles={{width: '100%',top: window.outerHeight/2 - 35 +'px'}}></Loader>;
        }

  return(
    <div id="WriteMsgComponent">
      {loaderView}
      <div className="posfix ce-bg ce_top1 ce_z101" style={this.state.tupleDim}>
        <div className="posrel">
          <a href="#"  className="ce_overlay ce_z102" > </a>

          <div className="posabs ce_z103 ce_top1 fullwid">
              <div className="pad18 brdr4" id="comm_headerMsg">
                {this.getWriteMsg_topView()}
              </div>


              <div className="message_con ce_scoll1" onScroll={this.WrieMsgScrollEvent} id="msgId">
                {this.getWriteMsg_innerView()}
              </div>

              <div>
                  {this.getPreMsg_cannotSend()}
              </div>

              <div id="parentFootId" className="clearfix">
                {this.getWriteMsg_buttonView()}
              </div>
          </div>

        </div>

      </div>
    </div>
    );
  }
}
