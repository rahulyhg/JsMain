/*
 * JsChat, a web based jabber client
 * Copyright (C) 2003-2004 Stefan Strigler <steve@zeank.in-berlin.de>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 *
 * 
 */


//var SITENAME = "xmpp.infoedge.com";

/* BACKENDS
 * Array of objects each describing a backend.
 *
 * Required object fields:
 * name      - human readable short identifier for this backend
 * httpbase  - base address of http service [see README for details]
 * type      - type of backend, must be 'polling' or 'binding'
 *
 * Optional object fields:
 * description     - a human readable description for this backend
 * servers_allowed - array of jabber server addresses users can connect to 
 *                   using this backend
 *
 * If BACKENDS contains more than one entry users may choose from a
 * select box which one to use when logging in.
 *
 * If 'servers_allowed' is empty or omitted user is presented an input
 * field to enter the jabber server to connect to by hand.
 * If 'servers_allowed' contains more than one element user is
 * presented a select box to choose a jabber server to connect to.
 * If 'servers_allowed' contains one single element no option is
 * presented to user.
 */
var GTALK_BOT_NAME="sathi@chat.jeevansathi.com";
//var SITE_URL="xmpp.infoedge.com";

var SITENAME = "www.jeevansathi.com";
var JABBERSERVER = "chat.jeevansathi.com";
var BACKEND_TYPE = "binding";
var HTTPBASE = "http-bind/";
var BACKENDS = 
[
		{
			name:"Open Relay",
			description:"HTTP Binding backend that allows connecting to any jabber server",
			httpbase:"jwchat/http-bind/",
			type:"binding",
			default_server: SITENAME
		}
];

var DEFAULTRESOURCE = "jeevansathi";
var DEFAULTPRIORITY = "10";

/* DEFAULTCONFERENCEGROUP + DEFAULTCONFERENCESERVER
 * default values for joingroupchat form
 */
var DEFAULTCONFERENCEROOM = "talks";
var DEFAULTCONFERENCESERVER = "conference."+SITENAME;

/* debugging options */
var DEBUG = false; // turn debugging on
var DEBUG_LVL = 4; // debug-level 0..4 (4 = very noisy)

var USE_DEBUGJID = false; // if true only DEBUGJID gets the debugger
var DEBUGJID = "admin@localhost"; // which user get's debug messages
var httpbase="jwchat/http-bind/";

// most probably you don't want to change anything below

var timerval = 2000; // poll frequency in msec


//var JABBERSERVER="xmpp.infoedge.com";
//var BACKEND_TYPE="binding";
//var HTTPBASE="/JHB/";

var stylesheet = "jwchat.css";
var THEMESDIR = "themes";

