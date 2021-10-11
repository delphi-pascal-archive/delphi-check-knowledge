unit NP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPPanel, XPMenu, Menus, XPLabel, XpMan, XPRadioButton,
  jpeg, ExtCtrls, XPButton, ShellApi, ComCtrls;

  const
  BorlandHome = wm_User + 1;
  DelphiHome  = wm_User + 2;
  Cherta      = wm_User + 3;

type
  TMainFrm = class(TForm)
    MainMenu: TMainMenu;
    FileItem: TMenuItem;
    ExitItem: TMenuItem;
    HelpItem: TMenuItem;
    AboutItem: TMenuItem;
    Wallpaper: TImage;
    fr1: TPanel;
    tx2: TXPLabel;
    fr2: TPanel;
    tx3: TXPLabel;
    fr3: TPanel;
    RunItem: TMenuItem;
    sp1: TMenuItem;
    Next: TXPButton;
    First: TRadioButton;
    Second: TRadioButton;
    Third: TRadioButton;
    tx4: TXPLabel;
    tx5: TXPLabel;
    SourceCodeItem: TMenuItem;
    sp5: TMenuItem;
    GNUItem: TMenuItem;
    SendReportItem: TMenuItem;
    LicItem: TMenuItem;
    sp2: TMenuItem;
    SysInfoItem: TMenuItem;
    sp4: TMenuItem;
    sp3: TMenuItem;
    Back: TXPButton;
    WebItem: TMenuItem;
    WebBorlandItem: TMenuItem;
    WebDelphiItem: TMenuItem;
    tx1: TXPLabel;
    StatusBar: TStatusBar;
    HomePageItem: TMenuItem;
    SendMailItem: TMenuItem;
    Send2tem: TMenuItem;
    Send1tem: TMenuItem;

    procedure NextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FirstClick(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure RunItemClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure SysInfoItemClick(Sender: TObject);
    procedure LicItemClick(Sender: TObject);
    procedure SendReportItemClick(Sender: TObject);
    procedure GNUItemClick(Sender: TObject);
    procedure SourceCodeItemClick(Sender: TObject);
    procedure AboutItemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure WebBorlandItemClick(Sender: TObject);
    procedure WebDelphiItemClick(Sender: TObject);
    procedure BackMouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure BackMouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure BackMouseLeave(Sender: TObject);
    procedure NextMouseLeave(Sender: TObject);
    procedure NextMouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure NextMouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure HomePageItemClick(Sender: TObject);
    procedure Send1temClick(Sender: TObject);
    procedure Send2temClick(Sender: TObject);
    
  private

    SM: HWND;

    procedure RightAnswer;

    procedure ErrorAnswer;
    
    procedure MySysMenu(var MySysMenu: TWmSysCommand);
    message Wm_SysCommand;

  public

  end;

var
  MainFrm: TMainFrm;

implementation

uses LP, AP, RR, NN, RP;

{$R *.dfm}

procedure TMainFrm.NextClick(Sender: TObject);
begin
case Next.tag of

0: begin
Next.tag:=1;
tx3.Caption := '������� ������� ������������ ������� �� ����������� ������';
tx4.Caption := '�������� ���� Delphi?';
tx5.Caption := '';
First.Caption := '3';
Second.Caption := '4';
Third.Caption := '5';
tx2.Caption := '������: 1';
end;

1: begin
Next.tag:=2;
tx3.Caption := '������� ������� ����������� � ������� �����������?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '10';
Second.Caption := '15';
Third.Caption := '������������ ����������';
tx2.Caption := '������: 2';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �1: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �1: ������������ �����');
end;
end;

2: begin
Next.tag:=3;
tx3.Caption := '��� ������������� �������� � ���� �����?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '������';
Second.Caption := '������ ��������� � ��������';
Third.Caption := '������ OK, Close';
tx2.Caption := '������: 3';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �2: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �2: ������������ �����');
end;
end;

3: begin
Next.tag:=4;
tx3.Caption := '��� ������������� �������� � ���� ����?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '������';
Second.Caption := '��� ���������� ��������';
Third.Caption := '��� ����������� ��� ������ ����';
tx2.Caption := '������: 4';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �3: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �3: ������������ �����');
end;
end;

4: begin
Next.tag:=5;
tx3.Caption := '��� ���������� ���� ���������� ��������?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '�������� �����';
Second.Caption := '�������� ����������� �������';
Third.Caption := '��������� ���������';
tx2.Caption := '������: 5';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �4: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �4: ������������ �����');
end;
end;

5: begin
Next.tag:=6;
tx3.Caption := '������� ������ ����, ��������� �������, �������, ���������';
tx4.Caption := '������?';
tx5.Caption := '';
First.Caption := 'File';
Second.Caption := 'Project';
Third.Caption := 'Help';
tx2.Caption := '������: 6';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �5: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �5: ������������ �����');
end;
end;

6: begin
Next.tag:=7;
tx3.Caption := '������� ������ ����, ��������� ����������� ����������';
tx4.Caption := '������������ �����?';
tx5.Caption := '';
First.Caption := 'Edit';
Second.Caption := 'View';
Third.Caption := 'Tools';
tx2.Caption := '������: 7';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �6: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �6: ������������ �����');
end;
end;

7: begin
Next.tag:=8;
tx3.Caption := '� ������� ������ ���� ����� ������� ���� ������ ��������?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'File';
Second.Caption := 'Search';
Third.Caption := 'View';
tx2.Caption := '������: 8';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �7: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �7: ������������ �����');
end;
end;

8: begin
Next.tag:=9;
tx3.Caption := '� ������� ������ ���� ����� ��������� ������ ������������?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'File';
Second.Caption := 'View';
Third.Caption := 'Tools';
tx2.Caption := '������: 9';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �8: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �8: ������������ �����');
end;
end;

9: begin
Next.tag:=10;
tx3.Caption := '� ����� ���� ����� �������� ���������� � ����� ���������?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'File';
Second.Caption := 'Project';
Third.Caption := 'Tools';
tx2.Caption := '������: 10';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �9: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �9: ������������ �����');
end;
end;

10: begin
Next.tag:=11;
tx3.Caption := '����� ������� ����������� � ��������� ���� ����������?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Run';
Second.Caption := 'Open';
Third.Caption := 'Exit';
tx2.Caption := '������: 11';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �10: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �10: ������������ �����');
end;
end;

11: begin
Next.tag:=12;
tx3.Caption := '��������� ���������� ����� ������� ������� �����������';
tx4.Caption := '����� ������� ������� � ����������� ����?';
tx5.Caption := '';
First.Caption := 'Standard';
Second.Caption := 'Additional';
Third.Caption := 'Win32';
tx2.Caption := '������: 12';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �11: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �11: ������������ �����');
end;
end;

12: begin
Next.tag:=13;
tx3.Caption := '��������� ���������� ����� ������� ������� �����������';
tx4.Caption := '����� ��������� ��������� � �������?';
tx5.Caption := '';
First.Caption := 'Standard';
Second.Caption := 'Additional';
Third.Caption := 'Win32';
tx2.Caption := '������: 13';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �12: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �12: ������������ �����');
end;
end;

13: begin
Next.tag:=14;
tx3.Caption := '����� ������� �������� ��� ������� ���������� ����?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Dialogs';
Second.Caption := 'Win32';
Third.Caption := 'Win3.1';
tx2.Caption := '������: 14';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �13: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �13: ������������ �����');
end;
end;

14: begin
Next.tag:=15;
tx3.Caption := '����� �� ������������ ������������� ����� ���������� Edit?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '��';
Second.Caption := '��, �� ������ �������';
Third.Caption := '���';
tx2.Caption := '������: 15';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �14: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �14: ������������ �����');
end;
end;

15: begin
Next.tag:=16;
tx3.Caption := '����� �� ������������ ������������� ����� ���������� Label?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '��';
Second.Caption := '��, �� ������ �������';
Third.Caption := '���';
tx2.Caption := '������: 16';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �15: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �15: ������������ �����');
end;
end;

16: begin
Next.tag:=17;
tx3.Caption := '��� ���������� ���� ������ �������� �� ���������� Button';
tx4.Caption := '� �������� ���������� �����?';
tx5.Caption := '';
First.Caption := '���� ����� ���������';
Second.Caption := '��������� �������� ����';
Third.Caption := '������';
tx2.Caption := '������: 17';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �16: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �16: ������������ �����');
end;
end;

17: begin
Next.tag:=18;
tx3.Caption := '��� ���������� ���� � �������� BorderStyle ����� ����������';
tx4.Caption := '�������� bsSingle?';
tx5.Caption := '';
First.Caption := '������ ����������� ��������� �������� �����';
Second.Caption := '������ ����������� ��������� �������� ����� � �������� ���������';
Third.Caption := '������ ����������� ��������� �������� ����� ��� ������ � ������� ����������';
tx2.Caption := '������: 18';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �17: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �17: ������������ �����');
end;
end;

18: begin
Next.tag:=19;
tx3.Caption := '����� �� � �������� ���������� �������� ������� ����������';
tx4.Caption := 'Button?';
tx5.Caption := '';
First.Caption := '���';
Second.Caption := '��, ���������� � ������ ��� ������';
Third.Caption := '��, ���������� � ������ ��� ������ � ������� Height � Width';
tx2.Caption := '������: 19';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �18: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �18: ������������ �����');
end;
end;

19: begin
Next.tag:=20;
tx3.Caption := '�� ��� �������� �������� Caption ���������� ��������?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '�� �������� �������';
Second.Caption := '�� �������� �����';
Third.Caption := '�� �������� ����������� �������';
tx2.Caption := '������: 20';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �19: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �19: ������������ �����');
end;
end;

20: begin
Next.tag:=21;
tx3.Caption := '� ������� ������ �������� ����� �������� �������� ������';
tx4.Caption := '�������� ���������� ScrollBar ��� ������� ������� ����';
tx5.Caption := '�� ������ ���������?';
First.Caption := 'SmallChange';
Second.Caption := 'LargeChange';
Third.Caption := 'Position';
tx2.Caption := '������: 21';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �20: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �20: ������������ �����');
end;
end;

21: begin
Next.tag:=22;
tx3.Caption := '��� ���������� ������ SpeedButton �� BitBth?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '���, ��� ����� ������������� � ���������� ���������';
Second.Caption := '���, ��� ����� ���������� ��������� �����������';
Third.Caption := '�����';
tx2.Caption := '������: 22';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �21: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �21: ������������ �����');
end;
end;

22: begin
Next.tag:=23;
tx3.Caption := '��� ���� ������ ��������� Image?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '��� ������������� ��������� �� �����';
Second.Caption := '��� ���������� �� ����� ��������� ��������';
Third.Caption := '��� �������� �������������� �����';
tx2.Caption := '������: 23';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �22: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �22: ������������ �����');
end;
end;

23: begin
Next.tag:=24;
tx3.Caption := '����� ��������� ������������ ��� ��������� �����������';
tx4.Caption := '��� ���������� ����� ��� ������������� �����?';
tx5.Caption := '';
First.Caption := 'Bevel';
Second.Caption := 'Splitter';
Third.Caption := 'ControlBar';
tx2.Caption := '������: 24';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �23: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �23: ������������ �����');
end;
end;

24: begin
Next.tag:=25;
tx3.Caption := '��� �������� ������������� ������������ ScrollBox?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '��������� ����� ����� ������������� ��������';
Second.Caption := '�������� ������������ �����';
Third.Caption := '��������� ������ ���������';
tx2.Caption := '������: 25';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �24: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �24: ������������ �����');
end;
end;

25: begin
Next.tag:=26;
tx3.Caption := '��������� LabelEdit ������������ �����:';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '���� Edit ��� ����������� ��������������';
Second.Caption := '������������� �����';
Third.Caption := '���� Edit � ������';
tx2.Caption := '������: 26';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �25: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �25: ������������ �����');
end;
end;

26: begin
Next.tag:=27;
tx3.Caption := '��� ���� ������ ��������� Shape?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '��� ������������� ��������� �� �����';
Second.Caption := '��� ���������� �� ����� ��������� ��������';
Third.Caption := '��� �������� �������������� �����';
tx2.Caption := '������: 27';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �26: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �26: ������������ �����');
end;
end;

27: begin
Next.tag:=28;
tx3.Caption := '��� ���������� ��������� TrackBar �� ���������� ProgressBar?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '�� ����� ������ �������� ��������';
Second.Caption := '���������� �� ���������';
Third.Caption := '���������� �������� ��������';
tx2.Caption := '������: 28';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �27: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �27: ������������ �����');
end;
end;

28: begin
Next.tag:=29;
tx3.Caption := '��� ����� ��������� Animate?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '���������� ����������� ��������';
Second.Caption := '���������� ���������� ����� ����� � �������� �������������';
Third.Caption := '���������� ������ �����������';
tx2.Caption := '������: 29';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �28: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �28: ������������ �����');
end;
end;

29: begin
Next.tag:=30;
tx3.Caption := '��� ���������� ��������� MounthCalendar �� ����������';
tx4.Caption := 'DateTimePicker?';
tx5.Caption := '';
First.Caption := '����� ���������� ������� �����';
Second.Caption := '����� ���������� ������������ ��������� ������� �������';
Third.Caption := '����� �������� ������� ����';
tx2.Caption := '������: 30';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �29: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �29: ������������ �����');
end;
end;

30: begin
Next.tag:=31;
tx3.Caption := '��� ���� ������ ��������� Timer?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '��� ������ ���������� ��������� �������';
Second.Caption := '��� ����������� ������� �� �����';
Third.Caption := '��� ������ ������� ������������ �� ���������� �������';
tx2.Caption := '������: 31';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �30: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �30: ������������ �����');
end;
end;

31: begin
Next.tag:=32;
tx3.Caption := '� ������� ������ ���������� ����� ������� ������';
tx4.Caption := '����������� �������?';
tx5.Caption := '';
First.Caption := 'OpenDialog';
Second.Caption := 'OpenPictureDialog';
Third.Caption := 'OpenDialog � OpenPictureDialog';
tx2.Caption := '������: 32';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �31: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �31: ������������ �����');
end;
end;

32: begin
Next.tag:=33;
tx3.Caption := '������� ������ �������� ����� ������� � ������� �������';
tx4.Caption := 'Dialogs?';
tx5.Caption := '';
First.Caption := '9';
Second.Caption := '11';
Third.Caption := '13';
tx2.Caption := '������: 33';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �32: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �32: ������������ �����');
end;
end;

33: begin
Next.tag:=34;
tx3.Caption := '���������� ����� ������� ������������� ��� ����������';
tx4.Caption := '�������� � ����������� ����������?';
tx5.Caption := '';
First.Caption := 'Standard';
Second.Caption := 'Win32';
Third.Caption := 'System';
tx2.Caption := '������: 34';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �33: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �33: ������������ �����');
end;
end;

34: begin
Next.tag:=35;
tx3.Caption := '��� ���������� ��������� StringGrid �� ���������� DrawGrid?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '���������� ��������� �������';
Second.Caption := '���������� ������� �������� ��� ����������� ������';
Third.Caption := '�����';
tx2.Caption := '������: 35';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �34: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �34: ������������ �����');
end;
end;

35: begin
Next.tag:=36;
tx3.Caption := '��� ���������� ��������� StaticText �� ���������� Label?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '�����';
Second.Caption := '�������������� ��������� ��������';
Third.Caption := '������������ ���������� �����������';
tx2.Caption := '������: 36';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �35: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �35: ������������ �����');
end;
end;

36: begin
Next.tag:=37;
tx3.Caption := '��������� ������������ ����� ������������ ���������';
tx4.Caption := '��������� MediaPlayer?';
tx5.Caption := '';
First.Caption := '�����';
Second.Caption := '���������� ������� �� �������� ����������';
Third.Caption := '���������� ������� �� ���� �������� �����';
tx2.Caption := '������: 37';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �36: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �36: ������������ �����');
end;
end;

37: begin
Next.tag:=38;
tx3.Caption := '����� ���� �� ������������ ����� ����� ������� Delphi 7?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Object TreeView';
Second.Caption := 'Object Inspector';
Third.Caption := 'Project Manager';
tx2.Caption := '������: 38';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �37: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �37: ������������ �����');
end;
end;

38: begin
Next.tag:=39;
tx3.Caption := '���������� ����� ������� ����� ����� ���������� �';
tx4.Caption := '��������� ��������� ���������� ������� Standard?';
tx5.Caption := '';
First.Caption := 'Additional';
Second.Caption := 'Win32';
Third.Caption := 'System';
tx2.Caption := '������: 39';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �38: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �38: ������������ �����');
end;
end;

39: begin
Next.tag:=40;
First.Checked := False;
Second.Checked := False;
Third.Checked := False;
Next.Enabled := False;
tx3.Caption := '� ������� ����������� ����� ������� �������� ���������';
tx4.Caption := '����������� ���������� ���� Windows?';
tx5.Caption := '';
First.Caption := 'Dialogs';
Second.Caption := 'System';
Third.Caption := 'Win32';
tx2.Caption := '������: 40';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �39: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �39: ������������ �����');
end;
end;

40: begin
Next.tag:=41;
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �40: ���������� �����');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('������ �40: ������������ �����');
end;
ResultFrm.Position := poMainFormCenter;
ResultFrm.ShowModal;
Next.tag:=1;
end;
end;
end;                              

procedure TMainFrm.FormCreate(Sender: TObject);
begin
Sm := GetSystemMenu(Handle, False);
InsertMenu(SM, word(-1), mf_Separator, Cherta, 'Delphi Home Page');
InsertMenu(SM, word(-2), mf_ByPosition, DelphiHome, 'Delphi Home Page');
InsertMenu(SM, word(-3), mf_ByPosition, BorlandHome, 'Borland Home Page');
DeleteMenu(SM, Sc_Restore, MF_STRING);
DeleteMenu(SM, Sc_Size, MF_STRING);
DeleteMenu(SM, Sc_Minimize, MF_STRING);
DeleteMenu(SM, Sc_Maximize, MF_STRING);
ModifyMenu(MainMenu.Handle, 1, mf_ByPosition or mf_Popup or mf_Help,
HelpItem.Handle, PChar(HelpItem.Caption));
RyMenu.Add(MainMenu, nil);
end;

procedure TMainFrm.FirstClick(Sender: TObject);
begin
Next.Enabled := True;
end;

procedure TMainFrm.ExitItemClick(Sender: TObject);
begin
Close;
end;

procedure TMainFrm.RunItemClick(Sender: TObject);
begin
Next.tag:=1;
tx3.Caption := '������� ������� ������������ ������� �� ����������� ������';
tx4.Caption := '�������� ���� Delphi?';
tx5.Caption := '';
First.Caption := '3';
Second.Caption := '4';
Third.Caption := '5';
First.Checked := False;
Second.Checked := False;
Third.Checked := False;
tx2.Caption := '������: 1';
Next.Enabled := False;
ResultFrm.ResultMemo.Lines.Clear;
ResultFrm.ResultMemo.Lines.Add('���� ����������:');
ResultFrm.ResultMemo.Lines.Add('');
fr1.Visible := True;
fr2.Visible := True;
fr3.Visible := True;
Next.Visible := True;
Back.Visible := True;
end;

procedure TMainFrm.RightAnswer;
begin
RightFrm.Position := poMainFormCenter;
RightFrm.ShowModal;
end;

procedure TMainFrm.ErrorAnswer;
begin
ErrorFrm.Position := poMainFormCenter;
ErrorFrm.ShowModal;
end;

procedure TMainFrm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TMainFrm.SysInfoItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'msInfo32', nil,nil, Sw_ShowNormal);
end;

procedure TMainFrm.LicItemClick(Sender: TObject);
begin
LicFrm.Position := poMainFormCenter;
LicFrm.ShowModal;
end;

procedure TMainFrm.SendReportItemClick(Sender: TObject);
begin
ShellExecute(Handle, 'open',
'mailto:GoodWinNix@mail.ru?Subject=������� �������� ������ Delphi - [Error]' +
'&Body=Error',
'', '', SW_SHOW);
end;

procedure TMainFrm.GNUItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.gnu.org/philosophy/', nil, nil, Sw_ShowNormal);
end;

procedure TMainFrm.SourceCodeItemClick(Sender: TObject);
begin
if Application.MessageBox(
'Copyright @2009 ������ ���� (aka ?���_�?)' + #13 +
'======================================' + #13 + #13 + '' +
'���� �� ������ �������� �������� ��� ������� (����� ' + #13
+ '� ������������ �� ������� ������������), � �����'
+ #13 + '��� ����������� ����� ������ ���������, ��' + #13 +
'��������� ����������� ������ ������.' + #13 +
'' +  #13 + '======================================' +  #13 +
'' +  #13 +
'��������� ������ ������?',
'������� �������� ������',
mb_IconAsterisk + mb_YesNo) = idYes then
begin
ShellExecute(Handle, 'open',
'mailto:GoodWinNix@mail.ru?Subject=������� �������� ������ Delphi' +
'&Body=Hello, please send me the source code program. Thanks!',
'', '', SW_SHOW);
end;
end;

procedure TMainFrm.AboutItemClick(Sender: TObject);
begin
AboutFrm.Position := poMainFormCenter;
AboutFrm.ShowModal;
end;

procedure TMainFrm.FormDestroy(Sender: TObject);
begin
Sm := GetSystemMenu(Handle, True);
MainFrm.OnActivate := nil;
Wallpaper.Free;
MainMenu.Free;
Second.Free;
First.Free;
Third.Free;
Next.Free;
Back.Free;
fr1.Free;
fr2.Free;
fr3.Free;
tx1.Free;
tx2.Free;
tx3.Free;
tx4.Free;
tx5.Free;
end;

procedure TMainFrm.WebBorlandItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.borland.com/', nil, nil, Sw_ShowNormal);
end;

procedure TMainFrm.WebDelphiItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.borland.com/delphi/index.html', nil, nil, Sw_ShowNormal);
end;

procedure TMainFrm.MySysMenu(var MySysMenu: TWmSysCommand);
begin
if MySysMenu.CmdType = BorlandHome then
ShellExecute(Handle, nil, 'http://www.borland.com/', nil, nil, Sw_ShowNormal);
if MySysMenu.CmdType = DelphiHome then
ShellExecute(Handle, nil, 'http://www.borland.com/delphi/index.html', nil, nil, Sw_ShowNormal);
inherited;
end;

procedure TMainFrm.BackMouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
Back.Font.Color := clRed;
end;

procedure TMainFrm.BackMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
Back.Font.Color := clBlack;
end;

procedure TMainFrm.BackMouseLeave(Sender: TObject);
begin
Back.Font.Color := clBlack;
end;

procedure TMainFrm.NextMouseLeave(Sender: TObject);
begin
Next.Font.Color := clBlack;
end;

procedure TMainFrm.NextMouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
Next.Font.Color := clBlack;
end;

procedure TMainFrm.NextMouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
Next.Font.Color := clRed;
end;

procedure TMainFrm.HomePageItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.viacoding.mylivepage.ru/', nil,nil, Sw_ShowNormal);
end;

procedure TMainFrm.Send1temClick(Sender: TObject);
begin
ShellExecute(Handle,'open',
'mailto:GoodWinNix@mail.ru?Subject=������� �������� ������ Delphi'+
'',
'','',SW_SHOW);
end;

procedure TMainFrm.Send2temClick(Sender: TObject);
begin
ShellExecute(Handle,'open',
'viacoding@mail.ru?Subject=������� �������� ������ Delphi'+
'',
'','',SW_SHOW);
end;

end.
