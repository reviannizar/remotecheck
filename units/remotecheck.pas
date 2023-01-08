unit remotecheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  iniFiles, Dialogs, StdCtrls, Registry, ExtCtrls;

Const
  APP_VERSION = '1.0.0.22';
  c_SECTION   = 'jbiru\medical\local\remoteaps';
  c_slot      = '\\.\mailslot\medical_local_remoteaps';
  c_szTip     = 'Aplikasi Check Remote';
  keyConfig   = 'Config';

type
  T_remotecheck = class(TForm)
    cmdSendKeys: TButton;
    tmr: TTimer;
    pnmain: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    nmClose: TButton;
    edTitle: TEdit;
    edSend: TEdit;
    cbCrlf: TCheckBox;
    procedure cmdSendKeysClick(Sender: TObject);
    procedure tmrTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure nmCloseClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
  private
    //procedure notepad;
    procedure SetReg(Write: boolean);
  public
    { Public declarations }
  end;

var
  _remotecheck: T_remotecheck;
  FConfig: TiniFile;
  sysReg: TRegIniFile;
  thisPath: String;

implementation

uses
  SendKeys;

{$R *.dfm}

procedure T_remotecheck.cmdSendKeysClick(Sender: TObject);
begin
  tmr.Enabled := true;
end;

procedure T_remotecheck.SetReg(Write: boolean);
var
  s: string;
begin
  if Write = False Then begin
    Top  := FConfig.ReadInteger(keyConfig,'Top', 0);
    Left := FConfig.ReadInteger(keyConfig,'Left', 0);
    edTitle.Text := FConfig.ReadString(keyConfig,'WindowTitle', '');
    edSend.Text  := FConfig.ReadString(keyConfig,'TextSend', '');
    tmr.Interval := FConfig.ReadInteger(keyConfig,'Interval', 1000);
    cbCrlf.Checked := FConfig.ReadBool(keyConfig,'CrLf', true);
  end else begin
    FConfig.WriteInteger(keyConfig,'Top',Top);
    FConfig.WriteInteger(keyConfig,'Left',Left);
    FConfig.WriteString(keyConfig,'WindowTitle',edTitle.Text);
    FConfig.WriteString(keyConfig,'TextSend',edSend.Text);
    FConfig.WriteInteger(keyConfig,'Interval',tmr.Interval);
    FConfig.WriteBool(keyConfig,'CrLf',cbCrlf.Checked);
  end;
end;

procedure T_remotecheck.tmrTimer(Sender: TObject);
var
  s: string;
begin
  s := edSend.Text;
  if cbCrlf.Checked then s := s + #13;
  if (edTitle.Text <> '') AND (s <> '') then SendKeysToTitle(edTitle.Text, s);
  tmr.Enabled := false;
end;

procedure T_remotecheck.FormCreate(Sender: TObject);
var
  iniFileName: string;
begin
  ThisPath := ExtractFilePath(Application.ExeName);
  iniFileName := ExtractFileName(Application.ExeName);
  delete(iniFileName, pos('.', iniFileName), 10);
  if FConfig = nil then FConfig := TIniFile.Create(ThisPath + iniFileName + '.ini');
  setReg(false);
end;

procedure T_remotecheck.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  setReg(true);
  FConfig.UpdateFile;
  FConfig.Free;
end;

procedure T_remotecheck.nmCloseClick(Sender: TObject);
begin
  Close;
end;

procedure T_remotecheck.FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer; var Resize: Boolean);
begin
  Resize := false;
end;

end.
