unit uFuncs;

interface

uses
  Vcl.Dialogs, Controls;

  procedure Alerta(Mensagem: string);
  procedure Erro(Mensagem: string);
  function Perguntar(Mensagem: string): boolean;

implementation

procedure Alerta(Mensagem: string);
begin
  MessageDlg(Mensagem, mtWarning, [mbok], 0);
end;

procedure Erro(Mensagem: string);
begin
  MessageDlg(Mensagem, mtError, [mbok], 0);
end;

function Perguntar(Mensagem: string): boolean;
begin
  Result := MessageDlg(Mensagem, mtConfirmation, [mbyes, mbno], 0) = mryes;
end;

end.
