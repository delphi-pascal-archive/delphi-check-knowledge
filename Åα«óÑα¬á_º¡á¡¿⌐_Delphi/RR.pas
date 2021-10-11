unit RR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, XPLabel;

type
  TRightFrm = class(TForm)
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
  RightFrm: TRightFrm;

implementation

uses NP;

{$R *.dfm}

procedure TRightFrm.FormClick(Sender: TObject);
begin
Close;
MainFrm.Show;
end;

procedure TRightFrm.FormDestroy(Sender: TObject);
begin
RightFrm.OnActivate := nil;
Wallpaper.Free;
tx1.Free;
tx2.Free;
end;

procedure TRightFrm.FormShow(Sender: TObject);
begin
MainFrm.Hide;
end;

procedure TRightFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
MainFrm.First.Checked := False;
MainFrm.Second.Checked := False;
MainFrm.Third.Checked := False;
MainFrm.Next.Enabled := False;
end;

end.
