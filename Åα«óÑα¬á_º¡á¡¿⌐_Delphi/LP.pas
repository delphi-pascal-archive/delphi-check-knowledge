unit LP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPButton, StdCtrls, ComCtrls, ExtCtrls, jpeg;

type
  TLicFrm = class(TForm)
    fr1: TPanel;
    ReadMe: TRichEdit;
    PrintText: TXPButton;
    Cancel: TXPButton;
    PrintDlg: TPrintDialog;
    Wallpaper: TImage;

    procedure PrintTextClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

  public

  end;

var
  LicFrm: TLicFrm;

implementation

{$R *.dfm}

procedure TLicFrm.PrintTextClick(Sender: TObject);
var
FFileName: String;
begin
if PrintDlg.Execute then
ReadMe.Print(FFileName);
end;

procedure TLicFrm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;

procedure TLicFrm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
Close;
end;

procedure TLicFrm.FormDestroy(Sender: TObject);
begin
LicFrm.OnActivate := nil;
Wallpaper.Free;
PrintText.Free;
PrintDlg.Free;
ReadMe.Free;
Cancel.Free;
fr1.Free;
end;

procedure TLicFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
ReadMe.SetFocus;
end;

end.
