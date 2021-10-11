unit NN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, XPLabel;

type
  TErrorFrm = class(TForm)
    tx1: TLabel;
    Wallpaper: TImage;
    tx2: TXPLabel;

    procedure FormClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

  public

  end;

var
  ErrorFrm: TErrorFrm;

implementation

uses NP;

{$R *.dfm}

procedure TErrorFrm.FormClick(Sender: TObject);
begin
Close;
MainFrm.Show;
end;

procedure TErrorFrm.FormDestroy(Sender: TObject);
begin
ErrorFrm.OnActivate := nil;
Wallpaper.Free;
tx1.Free;
tx2.Free;
end;

procedure TErrorFrm.FormShow(Sender: TObject);
begin
MainFrm.Hide;
end;

procedure TErrorFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MainFrm.First.Checked := False;
MainFrm.Second.Checked := False;
MainFrm.Third.Checked := False;
MainFrm.Next.Enabled := False;
end;

end.
