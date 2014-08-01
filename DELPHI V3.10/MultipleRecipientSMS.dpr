//.---------------------------------------------------------------------------.
//|  Software: HTTP API - SMS Multiple Recipients SMS Example                 |
//|  Version: 	3.10                                                          |
//|  Email: 	support@solutions4mobiles.com                                 |
//|  Info: 		http://www.solutions4mobiles.com                              |
//|  Phone:		+44 203 318 3618                                              |
//| ------------------------------------------------------------------------- |
//| Copyright (c) 1999-2014, Mobiweb Ltd. All Rights Reserved.                |
//| ------------------------------------------------------------------------- |
//| LICENSE:                                                                  |
//| Distributed under the General Public License v3 (GPLv3)                   |
//| http://www.gnu.org/licenses/gpl-3.0.html                                  |
//| This program is distributed AS IS and in the hope that it will be useful  |
//| WITHOUT ANY WARRANTY; without even the implied warranty of                |
//| MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                      |
//| ------------------------------------------------------------------------- |
//| SERVICES:                                                                 |
//| We offer a number of paid services at http//www.solutions4mobiles.com:    |
//| - Bulk SMS / MMS / Premium SMS Services	/ HLR Lookup Service              |
//| ------------------------------------------------------------------------- |
//| HELP:																	  |
//| - This class requires a valid HTTP API Account. Please email to           |
//| sales@solutions4mobiles.com to get one                                    |
//.---------------------------------------------------------------------------.

//  SMS Multiple Recipients SMS Example
//  @copyright 1999 - 2014 Mobiweb Ltd.

program MultipleRecipientSMS;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SysUtils, IdHTTP,Classes;

  var
  lHTTP: TIdHTTP;
  lParamList: TStringList;
  lResult: String;
begin
  lParamList := TStringList.Create;
  lParamList.Add('username=username');                						//The HTTP API username of your account.
  lParamList.Add('password=password');                						//The HTTP API password of your account.
  lParamList.Add('msgtext=Hello World');              						//The SMS Message text.
  lParamList.Add('originator=TestAccount');           						//The desired Originator of your message.
  lParamList.Add('phone=recipient1,recipient2');      						//The full International mobile number of the
                                                      						//recipient excluding the leeding +.
                                                      						//multiple recipients, separate each number with a
                                                      						//comma. Please note that no blanks can be used
  lParamList.Add('showDLR=0');                        						//Set to 1 for requesting delivery report
                                                      						//of this sms. A unique id is returned to use
                                                      						//with your delivery report request.
  lParamList.Add('charset=0');                        						//The SMS Message text Charset.
  lParamList.Add('msgtype=');                         						//If set to F the sms is sent as Flash.
  lParamList.Add('provider=solutions4mobiles.com');   						//The SMS Provider.

  lHTTP := TIdHTTP.Create(nil);                       						//Create object of class required for POST request.
  try
    lResult := lHTTP.Post('http://IPADDRESS/send_script', lParamList); 		//Execute the SMS HTTP API request.
    WriteLn(lResult);                                 						//Print response
    Readln;
  finally
    FreeAndNil(lHTTP);                                						//Flush and close objects.
    FreeAndNil(lParamList);
  end;
end.
