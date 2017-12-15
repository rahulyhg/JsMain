import React from 'react';
import GA from "../../common/components/GA";

export default class BasicInfo extends React.Component {
    constructor(props) {
        super();
        this.state = {'lastClicked':true};
    }
    showChatOnAppLayer(e){

        this.setState({showPromoLayer:true,lastClicked:true});
    }
    hideChatOnAppLayer(e){
            if ( e.target.id !== 'vpro_last_active' )
            {
                this.setState({showPromoLayer:false});
            }
        
      
    }
    render() {
        let have_child = "";
        if(this.props.about.have_child)
        {
      if(this.props.about.m_status == 'Never Married')
              have_child = this.props.about.have_child;
      else
        have_child = ", "+this.props.about.have_child;
        }

        var myInfo = <div className='hgt10'></div>;
        if(this.props.about.myinfo)
        {
            myInfo = <div className="fontlig pad2 wordBreak vpro_lineHeight" id="vpro_myinfo" >
                                        <div dangerouslySetInnerHTML={{__html:this.props.about.myinfo}} />
                                 </div>;
        }

        var appearanceTitle,appearance;
        if(this.props.about.appearance)
        {
            appearanceTitle = <div className="f14 color1">Appearance</div>
            appearance = <div className="fontlig pb15" id="vpro_appearance">{this.props.about.appearance}</div>
        }
        var special_case, special_case_title;
        if(this.props.about.special_case)
        {
            special_case_title = <div className="f14 color1">Special Cases</div>;
            special_case = <div className="fontlig pb15" id="vpro_special_case" >{this.props.about.special_case}</div>
        }
        let lastActive=(<div></div>);
        if(this.props.onlineInfo){
            if(this.props.onlineInfo==2)
                lastActive = (<span className="f11 color13" id="vpro_last_active" >{this.props.about.last_active}</span>);
            else lastActive= (<span><span className="f10 color13" style={{width:'10px',height:'10px',background: '#65EF79',borderRadius: '50%',marginLeft: '0px',marginRight: '0px',color: '#65EF79'}}>ab</span>&nbsp;<span onClick ={this.showChatOnAppLayer.bind(this)} className="f11 color13" id="vpro_last_active" >Online Now</span></span>);
        }
        let layerHtml = this.state.showPromoLayer ? <ChatLayer hideChatOnAppLayer={this.hideChatOnAppLayer.bind(this)}></ChatLayer> : <div></div>;
        return (
            <div className="pad5 bg4 fontlig color3 clearfix f14">
                {layerHtml}
                <div className="hgt10"></div>
                <div className="fl">
                    <span className="f18" id="vpro_username" >{this.props.about.username}</span>&nbsp;&nbsp;
                                {lastActive}
                </div>
                <div className="fr color2 f14 pt5 fontrobbold" id="vpro_subscription">{this.props.about.subscription_text}</div>
                <div className="clr hgt10"></div>
                <ul className="vpro_info fontlig">
                    <li className="wid49p" id="vpro_age" >
                        {this.props.about.age} Years&nbsp;
                        <span id="vpro_height">{this.props.about.height}</span>
                    </li>
                    <li className="wid49p" id="vpro_occupation" >
                        {this.props.about.occupation}
                    </li>
                    <li className="wid49p" id="vpro_caste" >
                        {this.props.about.caste}
                    </li>
                    <li className="wid49p" id="vpro_income" >
                        {this.props.about.income}
                    </li>
                    <li className="wid49p" id="vpro_mtongue" >
                        {this.props.about.mtongue}
                    </li>
                    <li className="wid49p" id="vpro_education" >
                        {this.props.about.educationOnSummary}
                    </li>
                    <li className="wid49p" id="vpro_location" >
                        {this.props.about.location}
                    </li>
                    <li className="wid49p wspace" id="vpro_m_status" >
                        {this.props.about.m_status}{have_child}
                    </li>
                </ul>
                {myInfo}
                {appearanceTitle}
                {appearance}
                {special_case_title}
                {special_case}
            </div>
        );
    }
}


class ChatLayer extends React.Component{
    constructor(props){
        super(props)
        this.state={
            style1:{}
        }
        this.GAObject = new GA();
    }
    
    componentDidMount(){
        let di = document.getElementById('chatSubLayer').getBoundingClientRect();
        
        this.setState({style1:{
                marginLeft:'-'+di.width/2+'px',marginTop:'-'+di.height/2+'px',
        }}); 
    }
    
    trackDownloadAppWithGA(){
        this.GAObject.trackJsEventGA("jsms","appD","1");
        window.location.href = "/static/appredirect";
    }
    render()
    {
        return (<div id="chatOnAppLayer" className="backoverlayL" onClick={(e) => this.props.hideChatOnAppLayer(e)}>
<div id="chatSubLayer" className="otpcenter cssLayerFix bg4 fontlig posabs" style={{...this.state.style1,left:'50%',top:'50%',width:'90%'}}>
<p className="color3 txtc pt20 txtl f16 padl30" align="left">Real time CHAT with online members<br /> on Jeevansathi App</p>
<p className="color4 txtc pt20 pb30 f14 txtl padl30 pt10" styletext-align="left">Other Benefits:<ul style={{listStylePosition:'inside'}}><li className="mt2">Get acceptances from online users</li><li className="mt2">Smoother,faster and richer experience</li><li className="mt2">100% Ad free experience guaranteed</li><li className="mt2">Real Time notifications on interests,<br />acceptances and recommendations</li></ul></p>
<div style={{lineHeight:'60px',borderTop:'1px solid #dbdbdb'}} className="txtc">
<div id="js-downApp" className="f19"><div onClick={this.trackDownloadAppWithGA.bind(this)} style={{color:'#d03e43'}}>Download App</div></div>
</div>
</div>
</div>);
    }
    
    
}