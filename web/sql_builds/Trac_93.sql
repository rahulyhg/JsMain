-- 
-- Table structure for table `CRM_DISPOSITION`
-- 

CREATE TABLE `CRM_DISPOSITION` (
  `ID` mediumint(9) NOT NULL auto_increment,
  `DISPOSOTION_VALUE` char(5) default NULL,
  `DISPOSOTION_LABEL` char(100) NOT NULL default '',
  `ACTIVE` char(1) NOT NULL default '',	
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `CRM_DISPOSITION`
-- 

INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (1, 'A', 'Activated / Activation Follow-up','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (2, 'AA', 'Already Alloted','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (3, 'CNC', 'Could Not Contact','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (4, 'D', 'Delete Profile','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (5, 'CF', 'Complaints & Feedback','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (6, 'DNC', 'Do Not Call','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (7, 'L', 'Leads for Registration','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (8, 'NI', 'Not Interested','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (9, 'PR', 'Payment Related','');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (10, 'S', 'Sales Conversion/Payment Recieved','');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (11, 'SAQ', 'Sales Query','');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (12, 'SC', 'Scheduled Call Back/Call Later','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (13, 'SEQ', 'Service Queries','Y');
INSERT INTO `CRM_DISPOSITION` (`ID`, `DISPOSOTION_VALUE`, `DISPOSOTION_LABEL`,`ACTIVE`) VALUES (14, 'SPR', 'Sales/Payment Related','Y');



-- Table structure for table `CRM_DISPOSITION_VALIDATION`
-- 

CREATE TABLE `CRM_DISPOSITION_VALIDATION` (
  `ID` mediumint(9) NOT NULL auto_increment,
  `DISPOSITION` char(5) default NULL,
  `VALIDATION_VALUE` char(5) default NULL,
  `VALIDATION_LABEL` char(110) NOT NULL default '',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM;

-- 
-- Dumping data for table `CRM_DISPOSITION_VALIDATION`
-- 

INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'A', 'A3', 'Client Not Internet Savvy - Unable to use Website');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'A', 'A1', 'Profile Completed');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'A', 'A4', 'DPP Refined');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'A', 'A5', 'EOI activity started');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'A', 'A2', 'Photo Added');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'A', 'A6', 'Follow Up for Photo');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'A', 'A7', 'Follow Up for EOI');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'A', 'A8', 'Follow Up for Vishwas Seal');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'AA', 'A1', 'List of all agents - Online, Offline, Operations - All people maped to JS CRM and active to be populated here');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CNC', 'CNC1', 'Answering Machine/Fax');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CNC', 'CNC2', 'Customer not available/Concerned person not available');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CNC', 'CNC3', 'Invalid Number/Incorrect Number/Incorrect Person/Number changed');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CNC', 'CNC4', 'No Answer/No Reply/Switched Off/Phone Busy/Blank Call/Network Busy/Call Disconnected');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CNC', 'CNC5', 'Language Barrier');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CNC', 'CNC6', 'Invalid Number');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D1', 'Abusive');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D2', 'Fake Profile');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D3', 'Fake photo/Obscene Photo');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D4', 'Spammer');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D5', 'Foreign Origin');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D6', 'Inappropriate content in the profile');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D7', 'Incorrect details on the profile');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D8', 'Looking for Dating/Flirting');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D9', 'Separated');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D10', 'Scam');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D11', 'Active on another JS Profile (Duplicate)');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D12', 'Already Engaged/Married');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D13', 'Dead/Deceased');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D14', 'Paid on another JS Profile (Duplicate)');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D15', 'Customer has requested to Delete Profile / Account');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D16', 'Duplicate profiles');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'D', 'D17', 'Competition');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CF', 'CF1', 'Complaint against an Agent/Mis-selling by Agent');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CF', 'CF2', 'Complaints on Product/Service');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CF', 'CF3', 'Feedback on Website/New Features suggestions');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CF', 'CF4', 'Profile made without consent');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CF', 'CF5', 'Complaint against a Member');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'CF', 'CF6', 'Positive Closure of Complaint');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'DNC', 'DNC1', 'Do not call for 15 days');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'DNC', 'DNC2', 'Part of DNC List');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'DNC', 'DNC3', 'Does not want any calls for 1 month');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'DNC', 'DNC4', 'Does not want any calls for 2 month');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'DNC', 'DNC5', 'Wants to Opt Out of receiving calls from Jeevansathi');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'L', 'L1', 'Branch Details Requested');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'L', 'L2', 'Fresh Leads');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'L', 'L3', 'Registered');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI1', 'Irrelevant/Non Serious');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI2', 'Active on other sources/websites');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI3', 'Competition (Person is a Employee of another Matrimony site)');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI4', 'Contacting Evalue members');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI5', 'Want Discount offers');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI6', 'Dissatisfied with the paid membership earlier ( Renewal)');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI7', 'Irrelevant Responses');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI8', 'No plans of marriage in the near future');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI9', 'Other Paid members are contacting me');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI10', 'Paid at Bharat Matrimony/Shaadi/SM/Others');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI11', 'Proposals in the pipeline');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI12', 'Test account');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'NI', 'NI13', 'Could not Contact');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'PR', 'PR1', 'Branch Details Requested');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'PR', 'PR2', 'Enquiry on activation');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'PR', 'PR3', 'Generate Online Payment Link');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'PR', 'PR4', 'IVR Payment');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'PR', 'PR5', 'Payment Confirmation');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'S', 'S1', 'Less than Rs 2000');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'S', 'S2', 'More than Rs 2000 with Add Ons');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'S', 'S3', 'More than  Rs 2000 without Add Ons');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SAQ', 'SAQ1', 'Festive Offers');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SAQ', 'SAQ2', 'Membership Features & Benefits');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SAQ', 'SAQ3', 'Payment Modes');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SAQ', 'SAQ4', 'Renewal discount');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SAQ', 'SAQ5', 'Upselling Membership');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SAQ', 'SAQ6', 'VD - Variable Discounting');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC1', 'Generate Online Payment Link/ Will Pay online');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC2', 'IVR Payment');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC3', 'Cash Pick up');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC4', 'Cheque Pick up');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC5', 'Cash Deposit');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC6', 'Cheque Deposit');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC7', 'Client Request/Client Busy');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC8', 'Hot Prospect');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC9', 'Lead/ LTF/ Registration Follow Up');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC10', 'Need time to decide / Consultation with Family');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC11', 'Need Discount');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC12', 'FTA / Activation Follow Up');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SC', 'SC13', 'Could not Contact');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ1', 'Add free months');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ2', 'Add/Change photo');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ3', 'Add horoscope');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ4', 'Add more call-directs quota');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ5', 'Advertising on JS');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ6', 'Branch Details Requested');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ7', 'Change Country');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ8', 'Change Date of Birth');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ9', 'Change Email ID');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ10', 'Change Gender field');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ11', 'Change Marital Status');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ12', 'Chat online');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ13', 'Completion of profile');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ14', 'Courier Service issues');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ15', 'Edit contact details/profile/password');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ16', 'Edit DPP');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ17', 'Eoi related');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ18', 'Fake profile');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ19', 'Featured Profile queries');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ20', 'Filters related queries');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ21', 'Forgot username and password/Login Issues');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ22', 'General information about website');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ23', 'Hide/Unhide my profile');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ24', 'Invalid Number reporting');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ25', 'Irrelevant people contacting me');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ26', 'Live Chat issues');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ27', 'MatchAlert related - Not getting enough responses');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ28', 'Others');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ29', 'People contacted not responding');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ30', 'Privacy settings');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ31', 'Reactivate profile/Retrieve Profile');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ32', 'Refund');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ33', 'Registeration related');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ34', 'Request for contact details of a profile');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ35', 'Response related issues/Unable to find good profiles');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ36', 'Screening of Profile/Photo');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ37', 'Search Related');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ38', 'Stop Response Booster');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ39', 'Success story related');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ40', 'Tampering of Profile/Changes made without authorization on profile');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ41', 'Tech related');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ42', 'Verify address details/Vishwas seal');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ43', 'Verify email id');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ44', 'Verify phone number');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ45', 'MatchAlert related - Irrelevant profiles coming');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SEQ', 'SEQ46', 'Could not Contact');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR1', 'Festive Offers Query');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR2', 'Branch Details Requested');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR3', 'Membership Features & Benefits');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR4', 'Payment Modes');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR5', 'Renewal discount');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR6', 'Upselling Membership');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR7', 'VD - Variable Discounting Enquiry');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR8', 'Payment Confirmation');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR9', 'Enquiry on activation');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR10', 'Paid (Sucessful Sale Closure)');
INSERT INTO `CRM_DISPOSITION_VALIDATION` (`ID`, `DISPOSITION`, `VALIDATION_VALUE`, `VALIDATION_LABEL`) VALUES ('', 'SPR', 'SPR11', 'Could not Contact');



