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
tx3.Caption := 'Сколько панелей инструментов состоит из графических кнопок';
tx4.Caption := 'главного окна Delphi?';
tx5.Caption := '';
First.Caption := '3';
Second.Caption := '4';
Third.Caption := '5';
tx2.Caption := 'Вопрос: 1';
end;

1: begin
Next.tag:=2;
tx3.Caption := 'Сколько вкладок расположено в палитре компонентов?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := '10';
Second.Caption := '15';
Third.Caption := 'Определяется настройкой';
tx2.Caption := 'Вопрос: 2';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №1: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №1: Неправильный ответ');
end;
end;

2: begin
Next.tag:=3;
tx3.Caption := 'Что первоначально содержит в себе форма?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Ничего';
Second.Caption := 'Строку заголовка с кнопками';
Third.Caption := 'Кнопки OK, Close';
tx2.Caption := 'Вопрос: 3';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №2: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №2: Неправильный ответ');
end;
end;

3: begin
Next.tag:=4;
tx3.Caption := 'Что первоначально содержит в окно кода?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Ничего';
Second.Caption := 'Код нескольких программ';
Third.Caption := 'Код необходимый для работы окна';
tx2.Caption := 'Вопрос: 4';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №3: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №3: Неправильный ответ');
end;
end;

4: begin
Next.tag:=5;
tx3.Caption := 'Что отображает окно инспектора объектов?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Свойства формы';
Second.Caption := 'Свойство выделенного объекта';
Third.Caption := 'Настройки программы';
tx2.Caption := 'Вопрос: 5';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №4: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №4: Неправильный ответ');
end;
end;

5: begin
Next.tag:=6;
tx3.Caption := 'Команды какого меню, позволяют создать, открыть, сохранить';
tx4.Caption := 'проект?';
tx5.Caption := '';
First.Caption := 'File';
Second.Caption := 'Project';
Third.Caption := 'Help';
tx2.Caption := 'Вопрос: 6';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №5: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №5: Неправильный ответ');
end;
end;

6: begin
Next.tag:=7;
tx3.Caption := 'Команды какого меню, позволяют привязывать компоненты';
tx4.Caption := 'координатной сетке?';
tx5.Caption := '';
First.Caption := 'Edit';
Second.Caption := 'View';
Third.Caption := 'Tools';
tx2.Caption := 'Вопрос: 7';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №6: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №6: Неправильный ответ');
end;
end;

7: begin
Next.tag:=8;
tx3.Caption := 'С помощью какого меню можно открыть окно дерево объектов?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'File';
Second.Caption := 'Search';
Third.Caption := 'View';
tx2.Caption := 'Вопрос: 8';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №7: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №7: Неправильный ответ');
end;
end;

8: begin
Next.tag:=9;
tx3.Caption := 'С помощью какого меню можно настроить панели инструментов?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'File';
Second.Caption := 'View';
Third.Caption := 'Tools';
tx2.Caption := 'Вопрос: 9';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №8: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №8: Неправильный ответ');
end;
end;

9: begin
Next.tag:=10;
tx3.Caption := 'В каком меню можно получить информацию о вашей программе?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'File';
Second.Caption := 'Project';
Third.Caption := 'Tools';
tx2.Caption := 'Вопрос: 10';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №9: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №9: Неправильный ответ');
end;
end;

10: begin
Next.tag:=11;
tx3.Caption := 'Какая команда компилирует и выполняет выше приложение?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Run';
Second.Caption := 'Open';
Third.Caption := 'Exit';
tx2.Caption := 'Вопрос: 11';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №10: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №10: Неправильный ответ');
end;
end;

11: begin
Next.tag:=12;
tx3.Caption := 'Используя компоненты какой вкладки палитры компонентов';
tx4.Caption := 'можно создать главное и контекстное меню?';
tx5.Caption := '';
First.Caption := 'Standard';
Second.Caption := 'Additional';
Third.Caption := 'Win32';
tx2.Caption := 'Вопрос: 12';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №11: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №11: Неправильный ответ');
end;
end;

12: begin
Next.tag:=13;
tx3.Caption := 'Используя компоненты какой вкладки палитры компонентов';
tx4.Caption := 'можно создавать диаграммы и графики?';
tx5.Caption := '';
First.Caption := 'Standard';
Second.Caption := 'Additional';
Third.Caption := 'Win32';
tx2.Caption := 'Вопрос: 13';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №12: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №12: Неправильный ответ');
end;
end;

13: begin
Next.tag:=14;
tx3.Caption := 'Какая вкладка содержит ряд типовых диалоговых окон?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Dialogs';
Second.Caption := 'Win32';
Third.Caption := 'Win3.1';
tx2.Caption := 'Вопрос: 14';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №13: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №13: Неправильный ответ');
end;
end;

14: begin
Next.tag:=15;
tx3.Caption := 'Может ли пользователь редактировать текст компонента Edit?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Да';
Second.Caption := 'Да, но только однажды';
Third.Caption := 'Нет';
tx2.Caption := 'Вопрос: 15';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №14: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №14: Неправильный ответ');
end;
end;

15: begin
Next.tag:=16;
tx3.Caption := 'Может ли пользователь редактировать текст компонента Label?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Да';
Second.Caption := 'Да, но только однажды';
Third.Caption := 'Нет';
tx2.Caption := 'Вопрос: 16';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №15: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №15: Неправильный ответ');
end;
end;

16: begin
Next.tag:=17;
tx3.Caption := 'Что произойдет если дважды щелкнуть на компоненте Button';
tx4.Caption := 'в процессе разработки формы?';
tx5.Caption := '';
First.Caption := 'Окно формы закроется';
Second.Caption := 'Откроется редактор кода';
Third.Caption := 'Ничего';
tx2.Caption := 'Вопрос: 17';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №16: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №16: Неправильный ответ');
end;
end;

17: begin
Next.tag:=18;
tx3.Caption := 'Что произойдет если в свойстве BorderStyle формы установить';
tx4.Caption := 'значение bsSingle?';
tx5.Caption := '';
First.Caption := 'Станет невозможным изменение размеров формы';
Second.Caption := 'Станет невозможным изменение размеров формы в процессе разработи';
Third.Caption := 'Станет невозможным изменение размеров формы при работе с готовой программой';
tx2.Caption := 'Вопрос: 18';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №17: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №17: Неправильный ответ');
end;
end;

18: begin
Next.tag:=19;
tx3.Caption := 'Можно ли в процессе разработке изменять размеры компонента';
tx4.Caption := 'Button?';
tx5.Caption := '';
First.Caption := 'Нет';
Second.Caption := 'Да, растягивая и сжимая его мышкой';
Third.Caption := 'Да, растягивая и сжимая его мышкой и изменяя Height и Width';
tx2.Caption := 'Вопрос: 19';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №18: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №18: Неправильный ответ');
end;
end;

19: begin
Next.tag:=20;
tx3.Caption := 'За что отвечает свойство Caption инспектора объектов?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'За название проекта';
Second.Caption := 'За название формы';
Third.Caption := 'За название выделенного объекта';
tx2.Caption := 'Вопрос: 20';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №19: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №19: Неправильный ответ');
end;
end;

20: begin
Next.tag:=21;
tx3.Caption := 'С помощью какого свойства можно изменять величену сдвига';
tx4.Caption := 'ползунка компонента ScrollBar при нажатии клавиши мыши';
tx5.Caption := 'на полосе прокрутки?';
First.Caption := 'SmallChange';
Second.Caption := 'LargeChange';
Third.Caption := 'Position';
tx2.Caption := 'Вопрос: 21';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №20: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №20: Неправильный ответ');
end;
end;

21: begin
Next.tag:=22;
tx3.Caption := 'Чем отличаются кнопки SpeedButton от BitBth?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Тем, что могут фиксироваться в утопленном состоянии';
Second.Caption := 'Тем, что могут отображать растровые изображения';
Third.Caption := 'Ничем';
tx2.Caption := 'Вопрос: 22';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №21: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №21: Неправильный ответ');
end;
end;

22: begin
Next.tag:=23;
tx3.Caption := 'Для чего служит компонент Image?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Для произвольного рисования на форме';
Second.Caption := 'Для размещения на форме растровых рисунков';
Third.Caption := 'Для создания геометрических фигур';
tx2.Caption := 'Вопрос: 23';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №22: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №22: Неправильный ответ');
end;
end;

23: begin
Next.tag:=24;
tx3.Caption := 'Какой компонент используется для рисования выступающих';
tx4.Caption := 'или утопленных линий или прямоугольных рамок?';
tx5.Caption := '';
First.Caption := 'Bevel';
Second.Caption := 'Splitter';
Third.Caption := 'ControlBar';
tx2.Caption := 'Вопрос: 24';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №23: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №23: Неправильный ответ');
end;
end;

24: begin
Next.tag:=25;
tx3.Caption := 'Что является отличительной особенностью ScrollBox?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Компонент носит чисто оформительный характер';
Second.Caption := 'Экономия пространства формы';
Third.Caption := 'Ускорение работы программы';
tx2.Caption := 'Вопрос: 25';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №24: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №24: Неправильный ответ');
end;
end;

25: begin
Next.tag:=26;
tx3.Caption := 'Компонент LabelEdit представляет собой:';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Поле Edit без возможности редактирования';
Second.Caption := 'Редактируемую метку';
Third.Caption := 'Поле Edit с меткой';
tx2.Caption := 'Вопрос: 26';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №25: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №25: Неправильный ответ');
end;
end;

26: begin
Next.tag:=27;
tx3.Caption := 'Для чего служит компонент Shape?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Для произвольного рисования на форме';
Second.Caption := 'Для размещения на форме растровых рисунков';
Third.Caption := 'Для создания геометрических фигур';
tx2.Caption := 'Вопрос: 27';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №26: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №26: Неправильный ответ');
end;
end;

27: begin
Next.tag:=28;
tx3.Caption := 'Чем отличается компонент TrackBar от компонента ProgressBar?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Не может менять числовую величену';
Second.Caption := 'Расположен по вертикали';
Third.Caption := 'Отображает числовую величину';
tx2.Caption := 'Вопрос: 28';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №27: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №27: Неправильный ответ');
end;
end;

28: begin
Next.tag:=29;
tx3.Caption := 'Что может компонент Animate?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Отображает стандартную анимацию';
Second.Caption := 'Отображает визуальную часть файла и звуковое сопровождение';
Third.Caption := 'Показывает сжатое изображение';
tx2.Caption := 'Вопрос: 29';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №28: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №28: Неправильный ответ');
end;
end;

29: begin
Next.tag:=30;
tx3.Caption := 'Чем отличается компонент MounthCalendar от компонента';
tx4.Caption := 'DateTimePicker?';
tx5.Caption := '';
First.Caption := 'Может отображать текущее время';
Second.Caption := 'Может отображать одновременно несколько смежных месяцев';
Third.Caption := 'Может выделять текущую дату';
tx2.Caption := 'Вопрос: 30';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №29: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №29: Неправильный ответ');
end;
end;

30: begin
Next.tag:=31;
tx3.Caption := 'Для чего служит компонент Timer?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Для отчета интервалов реального времени';
Second.Caption := 'Для отображения времени на форме';
Third.Caption := 'Для отчета времени затраченного на разработку проекта';
tx2.Caption := 'Вопрос: 31';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №30: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №30: Неправильный ответ');
end;
end;

31: begin
Next.tag:=32;
tx3.Caption := 'С помощью какого компонента можно создать диалог';
tx4.Caption := 'открывающий рисунки?';
tx5.Caption := '';
First.Caption := 'OpenDialog';
Second.Caption := 'OpenPictureDialog';
Third.Caption := 'OpenDialog и OpenPictureDialog';
tx2.Caption := 'Вопрос: 32';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №31: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №31: Неправильный ответ');
end;
end;

32: begin
Next.tag:=33;
tx3.Caption := 'Сколько разных диалогов можно создать с помощью вкладки';
tx4.Caption := 'Dialogs?';
tx5.Caption := '';
First.Caption := '9';
Second.Caption := '11';
Third.Caption := '13';
tx2.Caption := 'Вопрос: 33';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №32: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №32: Неправильный ответ');
end;
end;

33: begin
Next.tag:=34;
tx3.Caption := 'Компоненты какой вкладки придназначены для разработки';
tx4.Caption := 'программ с усложненным интерфесом?';
tx5.Caption := '';
First.Caption := 'Standard';
Second.Caption := 'Win32';
Third.Caption := 'System';
tx2.Caption := 'Вопрос: 34';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №33: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №33: Неправильный ответ');
end;
end;

34: begin
Next.tag:=35;
tx3.Caption := 'Чем отличается компонент StringGrid от компонента DrawGrid?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Отображает текстовую таблицу';
Second.Caption := 'Отображает таблицу рисунков или нетекстовых данных';
Third.Caption := 'Ничем';
tx2.Caption := 'Вопрос: 35';
if Second.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №34: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №34: Неправильный ответ');
end;
end;

35: begin
Next.tag:=36;
tx3.Caption := 'Чем отличается компонент StaticText от компонента Label?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Ничем';
Second.Caption := 'Невозможностью изменения размеров';
Third.Caption := 'Возможностью рельефного отображения';
tx2.Caption := 'Вопрос: 36';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №35: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №35: Неправильный ответ');
end;
end;

36: begin
Next.tag:=37;
tx3.Caption := 'Сколькими устройствами может одновременно управлять';
tx4.Caption := 'компонент MediaPlayer?';
tx5.Caption := '';
First.Caption := 'Одним';
Second.Caption := 'Количество зависит от настроек компонента';
Third.Caption := 'Количество зависит от типа звуковой карты';
tx2.Caption := 'Вопрос: 37';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №36: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №36: Неправильный ответ');
end;
end;

37: begin
Next.tag:=38;
tx3.Caption := 'Какое окно не отображается сразу после запуска Delphi 7?';
tx4.Caption := '';
tx5.Caption := '';
First.Caption := 'Object TreeView';
Second.Caption := 'Object Inspector';
Third.Caption := 'Project Manager';
tx2.Caption := 'Вопрос: 38';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №37: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №37: Неправильный ответ');
end;
end;

38: begin
Next.tag:=39;
tx3.Caption := 'Компоненты какой вкладки имеют общее назначение и';
tx4.Caption := 'дублируют некоторые компоненты вкладки Standard?';
tx5.Caption := '';
First.Caption := 'Additional';
Second.Caption := 'Win32';
Third.Caption := 'System';
tx2.Caption := 'Вопрос: 39';
if Third.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №38: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №38: Неправильный ответ');
end;
end;

39: begin
Next.tag:=40;
First.Checked := False;
Second.Checked := False;
Third.Checked := False;
Next.Enabled := False;
tx3.Caption := 'С помощью компонентов какой вкладки возможно создавать';
tx4.Caption := 'стандартные диалоговые окна Windows?';
tx5.Caption := '';
First.Caption := 'Dialogs';
Second.Caption := 'System';
Third.Caption := 'Win32';
tx2.Caption := 'Вопрос: 40';
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №39: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №39: Неправильный ответ');
end;
end;

40: begin
Next.tag:=41;
if First.Checked then
begin
RightAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №40: Правильный ответ');
end else
begin
ErrorAnswer;
ResultFrm.ResultMemo.Lines.Add('Вопрос №40: Неправильный ответ');
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
tx3.Caption := 'Сколько панелей инструментов состоит из графических кнопок';
tx4.Caption := 'главного окна Delphi?';
tx5.Caption := '';
First.Caption := '3';
Second.Caption := '4';
Third.Caption := '5';
First.Checked := False;
Second.Checked := False;
Third.Checked := False;
tx2.Caption := 'Вопрос: 1';
Next.Enabled := False;
ResultFrm.ResultMemo.Lines.Clear;
ResultFrm.ResultMemo.Lines.Add('Ваши результаты:');
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
'mailto:GoodWinNix@mail.ru?Subject=Система проверки знаний Delphi - [Error]' +
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
'Copyright @2009 Домани Олег (aka ?КТО_Я?)' + #13 +
'======================================' + #13 + #13 + '' +
'Если Вы хотите получить исходный код проекта (архив ' + #13
+ 'с компонентами по желанию пользователя), а также'
+ #13 + 'все последующие новые версии программы, то' + #13 +
'отправьте электронное письмо автору.' + #13 +
'' +  #13 + '======================================' +  #13 +
'' +  #13 +
'Отправить письмо сейчас?',
'Система проверки знаний',
mb_IconAsterisk + mb_YesNo) = idYes then
begin
ShellExecute(Handle, 'open',
'mailto:GoodWinNix@mail.ru?Subject=Система проверки знаний Delphi' +
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
'mailto:GoodWinNix@mail.ru?Subject=Система проверки знаний Delphi'+
'',
'','',SW_SHOW);
end;

procedure TMainFrm.Send2temClick(Sender: TObject);
begin
ShellExecute(Handle,'open',
'viacoding@mail.ru?Subject=Система проверки знаний Delphi'+
'',
'','',SW_SHOW);
end;

end.
