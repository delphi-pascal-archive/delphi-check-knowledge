unit AP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, StdCtrls, ComCtrls, XPButton, ExtCtrls, XPLabel, ShellApi;

type
  TAboutFrm = class(TForm)
    tx1: TXPLabel;
    tx2: TXPLabel;
    tx3: TXPLabel;
    tx4: TXPLabel;
    tx5: TXPLabel;
    tx7: TXPLabel;
    tx8: TXPLabel;
    Logo: TImage;
    tx6: TXPLabel;
    sp1: TBevel;
    sp2: TBevel;
    sp3: TBevel;
    sp4: TBevel;
    Cancel: TXPButton;
    License: TRichEdit;
    Wallpaper: TImage;
    tx9: TXPLabel;

    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure tx6MouseLeave(Sender: TObject);
    procedure tx6MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx6MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx7MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx7MouseLeave(Sender: TObject);
    procedure tx7MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tx7Click(Sender: TObject);
    procedure tx6Click(Sender: TObject);
    procedure tx9Click(Sender: TObject);
    procedure tx9MouseLeave(Sender: TObject);
    procedure tx9MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx9MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);

  private

  public

  end;

var
  AboutFrm: TAboutFrm;

implementation

{$R *.dfm}

procedure TAboutFrm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TAboutFrm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
Close;
end;

procedure TAboutFrm.tx6MouseLeave(Sender: TObject);
begin
tx6.ForegroundColor := $00FF8000;
end;

procedure TAboutFrm.tx6MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx6.ForegroundColor := $00FF8000;
end;

procedure TAboutFrm.tx6MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx6.ForegroundColor := clRed;
end;

procedure TAboutFrm.tx7MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx7.ForegroundColor := clRed;
end;

procedure TAboutFrm.tx7MouseLeave(Sender: TObject);
begin
tx7.ForegroundColor := $00FF8000;
end;

procedure TAboutFrm.tx7MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx7.ForegroundColor := $00FF8000;
end;

procedure TAboutFrm.FormDestroy(Sender: TObject);
begin
AboutFrm.OnActivate := nil;
Wallpaper.Free;
License.Free;
Cancel.Free;
Logo.Free;
sp1.Free;
sp2.Free;
sp3.Free;
sp4.Free;
tx1.Free;
tx2.Free;
tx3.Free;
tx4.Free;
tx5.Free;
tx6.Free;
tx7.Free;
tx8.Free;
end;

procedure TAboutFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Cancel.SetFocus;
end;

procedure TAboutFrm.tx7Click(Sender: TObject);
begin
ShellExecute(Handle,'open',
'mailto:GoodWinNix@mail.ru?Subject=Система проверки знаний Delphi'+
'',
'','',SW_SHOW);
end;

procedure TAboutFrm.tx6Click(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.viacoding.mylivepage.ru/', nil,nil, Sw_ShowNormal);
end;

procedure TAboutFrm.tx9Click(Sender: TObject);
begin
ShellExecute(Handle,'open',
'mailto:viacoding@mail.ru?Subject=Система проверки знаний Delphi'+
'',
'','',SW_SHOW);
end;

procedure TAboutFrm.tx9MouseLeave(Sender: TObject);
begin
tx9.ForegroundColor := $00FF8000;
end;

procedure TAboutFrm.tx9MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx9.ForegroundColor := clRed;
end;

procedure TAboutFrm.tx9MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx9.ForegroundColor := $00FF8000;
end;

end.
