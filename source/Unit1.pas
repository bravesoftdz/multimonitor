unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, MultiMon;

type
  TForm1 = class(TForm)
    cbMonitor: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnOrientationClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

type
  TMonitorInfoEx = record
    cbSize: DWORD;
    rcMonitor: TRect;
    rcWork: TRect;
    dwFlags: DWORD;
    szDevice: array[0..CCHDEVICENAME - 1] of AnsiChar;
  end;

const
  DM_DISPLAYORIENTATION = $00800000;
  ENUM_CURRENT_SETTINGS =-1;
  DMDO_DEFAULT : DWORD  = 0;
  DMDO_90      : DWORD  = 1;
  DMDO_180     : DWORD  = 2;
  DMDO_270     : DWORD  = 3;

{$R *.dfm}

procedure ChangeOrientation(Mon : integer; NewOrientation:DWORD);
var
  dm      : TDeviceMode;
  dwTemp  : DWORD;
  dmDisplayOrientation : DWORD;
  monInfo : TMonitorInfoEx;
  wdchar : PWideChar;
begin
  ZeroMemory(@dm, sizeof(dm));
  dm.dmSize   := sizeof(dm);
  monInfo.cbSize := sizeof(monInfo);

  if not GetMonitorInfo(Screen.Monitors[Mon].Handle, @monInfo) then
    RaiseLastOSError;

  wdchar := Addr ( UnicodeString(monInfo.szDevice)[1]);

  if EnumDisplaySettings(wdchar, DWORD(ENUM_CURRENT_SETTINGS), dm) then
  begin
    Move(dm.dmScale,dmDisplayOrientation,SizeOf(dmDisplayOrientation));
    // swap width and height
    if Odd(dmDisplayOrientation)<>Odd(NewOrientation) then
    begin
     dwTemp := dm.dmPelsHeight;
     dm.dmPelsHeight:= dm.dmPelsWidth;
     dm.dmPelsWidth := dwTemp;
    end;

    if dmDisplayOrientation<>NewOrientation then
    begin
      Move(NewOrientation,dm.dmScale,SizeOf(NewOrientation));
      if (ChangeDisplaySettingsEx(wdchar,dm, 0,CDS_UPDATEREGISTRY,0)<>DISP_CHANGE_SUCCESSFUL) then
       RaiseLastOSError;
    end;
  end;

end;

procedure TForm1.BtnOrientationClick(Sender: TObject);
var
  idx : integer;
begin

  idx := cbMonitor.ItemIndex;

  if idx <= Screen.MonitorCount - 1 then
  begin

    case Tbutton(Sender).Tag of
      1 : ChangeOrientation(idx,DMDO_DEFAULT);
      2 : ChangeOrientation(idx,DMDO_90);
      3 : ChangeOrientation(idx,DMDO_180);
      4 : ChangeOrientation(idx,DMDO_270);
    end;

  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i : integer;
begin

  for i := 0 to Screen.MonitorCount-1 do
  begin
    cbMonitor.Items.Add('Monitor ' + IntToStr(i));
  end;

  if cbMonitor.Items.Count > 0 then
    cbMonitor.ItemIndex := 0;

end;

end.
