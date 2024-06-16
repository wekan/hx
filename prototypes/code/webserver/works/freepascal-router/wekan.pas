program wekan;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  SysUtils, fphttpapp, HTTPDefs, httproute;

procedure catchallEndpoint(aRequest: TRequest; aResponse: TResponse);
begin
  aResponse.Content:='This endpoint is not available';
  aResponse.Code:=404;
  aResponse.ContentType:='text/plain';
  aResponse.ContentLength:=Length(aResponse.Content);
  aResponse.SendContent;
end;

procedure loginEndpoint(aRequest: TRequest; aResponse: TResponse);
begin
  aResponse.Content:='Hello Login';
  aResponse.Code:=200;
  aResponse.ContentType:='text/plain';
  aResponse.ContentLength:=Length(aResponse.Content);
  aResponse.SendContent;
end;

procedure jsonEndpoint(aRequest: TRequest; aResponse: TResponse);
begin
  aResponse.Content:='{"everything":"great"}';
  aResponse.Code:=200;
  aResponse.ContentType:='application/json';
  aResponse.ContentLength:=Length(aResponse.Content);
  aResponse.SendContent;
end;

begin
  Application.Port:=5000;
  HTTPRouter.RegisterRoute('/', rmGet, @loginEndpoint);
  HTTPRouter.RegisterRoute('/json', rmGet, @jsonEndpoint);
  HTTPRouter.RegisterRoute('/catchall', rmAll, @catchallEndpoint, true);
  Application.Threaded:=false;
  Application.Initialize;
  Writeln('Server is ready at localhost:' + IntToStr(Application.Port));
  Application.Run;
end.
