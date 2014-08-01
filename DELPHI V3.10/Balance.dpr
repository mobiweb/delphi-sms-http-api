//.---------------------------------------------------------------------------.
//|  Software: HTTP API - Get SMS Account Balance Example                     |
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

//  Get SMS Account Balance Example
//  @copyright 1999 - 2014 Mobiweb Ltd.

program Balance;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  SysUtils,
  IdHTTP,
  Classes;

var
  lHTTP: TIdHTTP;
  lParamList: TStringList;
  lResult: String;
begin
  lParamList := TStringList.Create;
  lParamList.Add('username=username');                							//The HTTP API username of your account.
  lParamList.Add('password=password');                							//The HTTP API password of your account.
  lParamList.Add('provider=solutions4mobiles.com');   							//The SMS Provider.

  lHTTP := TIdHTTP.Create(nil);                       							//Create object of class required for POST request.
  try
    lResult := lHTTP.Post('http://IPADDRESS/balance_script', lParamList); 		//Execute the SMS HTTP API request.
    WriteLn(lResult);                                 							//Print response
    Readln;
  finally
    FreeAndNil(lHTTP);                                							//Flush and close objects.
    FreeAndNil(lParamList);
  end;
end.
