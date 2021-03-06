import {getParameterByName} from '../../common/components/UrlDecoder';
import * as CONSTANTS from '../../common/constants/apiConstants';


export function getProfileLocalStorage(profileLocalStorageKey,profileKey)
{

	let profileLocalStorageArray = JSON.parse(localStorage.getItem(profileLocalStorageKey));
	let indexInLocalStorage = isPresentInLocalStorage(profileLocalStorageKey,profileKey);
	if ( indexInLocalStorage === false )
	{
		return null;
	}
	else
	{
		let cur = profileLocalStorageArray[indexInLocalStorage];
		profileLocalStorageArray.splice(indexInLocalStorage, 1);
		profileLocalStorageArray.unshift(cur);

		localStorage.setItem(profileLocalStorageKey,JSON.stringify(profileLocalStorageArray));
		return cur.profileGunaData;
	}
}


export function setProfileLocalStorage(profileLocalStorageKey,profileKey,profileGunaData)
{
	let profileLocalStorageArray = JSON.parse(localStorage.getItem(profileLocalStorageKey));
	if ( profileLocalStorageArray == null )
	{
		profileLocalStorageArray = [];
	}
	if ( (isPresentInLocalStorage(profileLocalStorageKey,profileKey) === false) )
	{
		let new_profileGunaData = {profileGunaData:profileGunaData,profileUrl:profileKey,time:new Date};
		profileLocalStorageArray.unshift(new_profileGunaData);
		if ( Object.keys(profileLocalStorageArray).length > CONSTANTS.PROFILE_GUNA_LOCAL_STORAGE_SIZE)
		{
			profileLocalStorageArray.pop();
		}
		localStorage.setItem(profileLocalStorageKey,JSON.stringify(profileLocalStorageArray));
	}
	else
	{
	}
}

export function isPresentInLocalStorage(profileLocalStorageKey,profileKey)
{	
	let profileLocalStorageArray = JSON.parse(localStorage.getItem(profileLocalStorageKey));
	if ( profileLocalStorageArray == null )
		return false;
	for (var i = 0; i < profileLocalStorageArray.length; i++) {
		if ( profileKey == profileLocalStorageArray[i].profileUrl )
		{
			let time_difference = ((new Date() - new Date(profileLocalStorageArray[i].time)) / 1000 );
			if ( time_difference > CONSTANTS.PROFILE_GUNA_LOCAL_STORAGE_TIME_LIMIT)
			{
				profileLocalStorageArray.splice(i,1);
				localStorage.setItem(profileLocalStorageKey,JSON.stringify(profileLocalStorageArray));
				return false;
			}
			else
			{
				return i;
			}
		}
	}
	return false;
}

export function removeProfileLocalStorage(profileLocalStorageKey,profileKey)
{
	let profileLocalStorageArray = JSON.parse(localStorage.getItem(profileLocalStorageKey));
	if ( profileLocalStorageArray == null )
		return false;
	for (var i = 0; i < profileLocalStorageArray.length; i++) 
	{

		if ( profileKey == profileLocalStorageArray[i].profileUrl )
		{
			profileLocalStorageArray.splice(i,1);
			localStorage.setItem(profileLocalStorageKey,JSON.stringify(profileLocalStorageArray));
		}
	}
}

export function getProfileKeyLocalStorage(queryString=null)
{
	if ( queryString == null )
		queryString = window.location.href;
return queryString;
	let urlString = '';
	let contact_id = getParameterByName(queryString,"contact_id");
	let actual_offset = getParameterByName(queryString,"actual_offset");
	let total_rec = getParameterByName(queryString,"total_rec");
	let searchid = getParameterByName(queryString,"searchid");
	let profilechecksum = getParameterByName(queryString,"profilechecksum");
	let username = getParameterByName(queryString,"username");
    let similarOf = getParameterByName(window.location.href,"similarOf");
    let listingName = getParameterByName(window.location.href,"listingName");


	
	if ( profilechecksum != null )
	{
		urlString = urlString + "_"+profilechecksum.toString();
	}
	else
	{
		if ( contact_id != null )
		{
			urlString = urlString + contact_id.toString();
		}
		if ( actual_offset != null )
		{
			urlString = urlString + "_"+actual_offset.toString();
		}
		if ( total_rec != null )
		{
			urlString = urlString + "_"+total_rec.toString();
		}
		if ( searchid != null )
		{
			urlString = urlString + "_"+searchid.toString();
		}
		if ( username != null )
		{
			urlString = urlString + "_"+username.toString();
		}
		
		if ( similarOf != null )
		{
			urlString = urlString + "_"+similarOf.toString();
		}
		if ( listingName != null )
		{
			urlString = urlString + "_"+listingName.toString();
		}
	}
	return urlString;
}	

export function getGunaKeyLocalStorage(queryString=null)
{
	let urlString = '';
	if ( queryString == null )
	{
	}
	else
	{
		let oprofile = getParameterByName(queryString,"oprofile");
		if ( oprofile != null )
		{
			urlString = urlString + oprofile.toString();
		}
		
	}
	return urlString;
}

//this function takes the keys for which data is to be maintained in Local Storage and clears the rest
export function onLogout(keysToKeep)
{
	

	let localStorageArray = {};	
	// for(let i=0;i<keysToKeep.length;i++)
	// {	
	// 	localStorageArray[keysToKeep[i]] = JSON.parse(localStorage.getItem(keysToKeep[i]));
	// }
	localStorage.clear();	
	// for(let i=0;i<keysToKeep.length;i++)
	// {	
	// 	localStorage.setItem(keysToKeep[i],JSON.stringify(localStorageArray[keysToKeep[i]]));
	// }
}	