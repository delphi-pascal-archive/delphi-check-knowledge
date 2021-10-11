unit RP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TResultFrm = class(TForm)
    ResultMemo: TMemo;

    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  ResultFrm: TResultFrm;

implementation

uses NP;

{$R *.dfm}

procedure TResultFrm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
Close;
end;

procedure TResultFrm.FormDestroy(Sender: TObject);
begin
ResultFrm.OnActivate := nil;
ResultMemo.Free;
end;

procedure TResultFrm.FormShow(Sender: TObject);
begin
MainFrm.tx3.Caption := '';
MainFrm.tx4.Caption := '';
MainFrm.tx5.Caption := '';
MainFrm.First.Caption := '';
MainFrm.Second.Caption := '';
MainFrm.Third.Caption := '';
MainFrm.First.Checked := False;
MainFrm.Second.Checked := False;
MainFrm.Third.Checked := False;
MainFrm.tx2.Caption := 'Вопрос:';
MainFrm.Next.Enabled := False;
MainFrm.fr1.Visible := False;
MainFrm.fr2.Visible := False;
MainFrm.fr3.Visible := False;
MainFrm.Next.Visible := False;
MainFrm.Back.Visible := False;
end;

end.
