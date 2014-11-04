/***************************************************************
 * Name:      tesgridMain.cpp
 * Purpose:   Code for Application Frame
 * Author:     ()
 * Created:   2012-07-05
 * Copyright:  ()
 * License:
 **************************************************************/

#include "wx_pch.h"
#include "tesgridMain.h"
#include <wx/msgdlg.h>

//(*InternalHeaders(tesgridFrame)
#include <wx/intl.h>
#include <wx/string.h>
//*)
#include <list>
#include <iostream>
//#include <fstream>
#include <list>
#include <cstdlib>
#include <cstdio>
#include <string>
//#include "ai.h"

//helper functions
enum wxbuildinfoformat {
    short_f, long_f };

wxString wxbuildinfo(wxbuildinfoformat format)
{
    wxString wxbuild(wxVERSION_STRING);

    if (format == long_f )
    {
#if defined(__WXMSW__)
        wxbuild << _T("-Windows");
#elif defined(__UNIX__)
        wxbuild << _T("-Linux");
#endif

#if wxUSE_UNICODE
        wxbuild << _T("-Unicode build");
#else
        wxbuild << _T("-ANSI build");
#endif // wxUSE_UNICODE
    }

    return wxbuild;
}

//(*IdInit(tesgridFrame)
const long tesgridFrame::ID_GRID1 = wxNewId();
const long tesgridFrame::ID_RADIOBUTTON1 = wxNewId();
const long tesgridFrame::ID_RADIOBUTTON2 = wxNewId();
const long tesgridFrame::ID_STATICTEXT11 = wxNewId();
const long tesgridFrame::ID_STATICTEXT12 = wxNewId();
const long tesgridFrame::ID_GAUGE1 = wxNewId();
const long tesgridFrame::ID_STATICTEXT13 = wxNewId();
const long tesgridFrame::ID_BUTTON4 = wxNewId();
const long tesgridFrame::ID_BUTTON5 = wxNewId();
const long tesgridFrame::ID_STATICTEXT1 = wxNewId();
const long tesgridFrame::ID_TEXTCTRL1 = wxNewId();
const long tesgridFrame::ID_STATICTEXT2 = wxNewId();
const long tesgridFrame::ID_TEXTCTRL2 = wxNewId();
const long tesgridFrame::ID_BUTTON1 = wxNewId();
const long tesgridFrame::ID_BUTTON3 = wxNewId();
const long tesgridFrame::ID_STATICTEXT3 = wxNewId();
const long tesgridFrame::ID_STATICTEXT4 = wxNewId();
const long tesgridFrame::ID_STATICTEXT5 = wxNewId();
const long tesgridFrame::ID_STATICTEXT6 = wxNewId();
const long tesgridFrame::ID_STATICTEXT7 = wxNewId();
const long tesgridFrame::ID_STATICTEXT8 = wxNewId();
const long tesgridFrame::ID_STATICTEXT9 = wxNewId();
const long tesgridFrame::ID_STATICTEXT10 = wxNewId();
const long tesgridFrame::ID_CHOICE1 = wxNewId();
const long tesgridFrame::ID_BUTTON2 = wxNewId();
const long tesgridFrame::ID_PANEL1 = wxNewId();
const long tesgridFrame::idMenuQuit = wxNewId();
const long tesgridFrame::idMenuAbout = wxNewId();
const long tesgridFrame::ID_STATUSBAR1 = wxNewId();
//*)

BEGIN_EVENT_TABLE(tesgridFrame,wxFrame)
    //(*EventTable(tesgridFrame)
    //*)
END_EVENT_TABLE()

tesgridFrame::tesgridFrame(wxWindow* parent,wxWindowID id)
{
    //(*Initialize(tesgridFrame)
    wxStaticBoxSizer* StaticBoxSizer2;
    wxFlexGridSizer* FlexGridSizer4;
    wxMenuItem* MenuItem2;
    wxStaticBoxSizer* StaticBoxSizer4;
    wxFlexGridSizer* FlexGridSizer3;
    wxMenuItem* MenuItem1;
    wxFlexGridSizer* FlexGridSizer5;
    wxFlexGridSizer* FlexGridSizer2;
    wxBoxSizer* BoxSizer2;
    wxMenu* Menu1;
    wxStaticBoxSizer* StaticBoxSizer3;
    wxStaticBoxSizer* StaticBoxSizer6;
    wxBoxSizer* BoxSizer1;
    wxMenuBar* MenuBar1;
    wxFlexGridSizer* FlexGridSizer6;
    wxStaticBoxSizer* StaticBoxSizer1;
    wxFlexGridSizer* FlexGridSizer1;
    wxBoxSizer* BoxSizer3;
    wxMenu* Menu2;
    wxStaticBoxSizer* StaticBoxSizer5;

    Create(parent, wxID_ANY, wxEmptyString, wxDefaultPosition, wxDefaultSize, wxDEFAULT_FRAME_STYLE, _T("wxID_ANY"));
    BoxSizer1 = new wxBoxSizer(wxHORIZONTAL);
    Panel1 = new wxPanel(this, ID_PANEL1, wxDefaultPosition, wxDefaultSize, wxTAB_TRAVERSAL, _T("ID_PANEL1"));
    BoxSizer2 = new wxBoxSizer(wxHORIZONTAL);
    Grid1 = new wxGrid(Panel1, ID_GRID1, wxDefaultPosition, wxSize(210,210), 0, _T("ID_GRID1"));
    Grid1->CreateGrid(7,7);
    Grid1->SetColLabelSize(0);
    Grid1->SetRowLabelSize(0);
    Grid1->SetDefaultColSize(30, false);
    Grid1->SetDefaultRowSize(30, false);
    Grid1->DisableDragGridSize();
    Grid1->EnableDragCell();
    Grid1->SetDefaultCellBackgroundColour(*wxWHITE);
    Grid1->EnableEditing(true);
    Grid1->EnableGridLines(true);
    Grid1->SetDefaultCellFont( Grid1->GetFont() );
    Grid1->SetDefaultCellTextColour( Grid1->GetForegroundColour() );
    BoxSizer2->Add(Grid1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    FlexGridSizer1 = new wxFlexGridSizer(0, 1, 0, 0);
    StaticBoxSizer1 = new wxStaticBoxSizer(wxHORIZONTAL, Panel1, _("Agent State"));
    RadioButton1 = new wxRadioButton(Panel1, ID_RADIOBUTTON1, _("Off"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_RADIOBUTTON1"));
    StaticBoxSizer1->Add(RadioButton1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    RadioButton2 = new wxRadioButton(Panel1, ID_RADIOBUTTON2, _("On"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_RADIOBUTTON2"));
    StaticBoxSizer1->Add(RadioButton2, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    FlexGridSizer5 = new wxFlexGridSizer(2, 1, 0, 0);
    StaticText11 = new wxStaticText(Panel1, ID_STATICTEXT11, wxEmptyString, wxDefaultPosition, wxDefaultSize, 0, _T("ID_STATICTEXT11"));
    FlexGridSizer5->Add(StaticText11, 0, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticText12 = new wxStaticText(Panel1, ID_STATICTEXT12, wxEmptyString, wxDefaultPosition, wxSize(150,13), 0, _T("ID_STATICTEXT12"));
    FlexGridSizer5->Add(StaticText12, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticBoxSizer1->Add(FlexGridSizer5, 3, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    FlexGridSizer1->Add(StaticBoxSizer1, 0, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 1);
    StaticBoxSizer6 = new wxStaticBoxSizer(wxHORIZONTAL, Panel1, _("Komunikasi"));
    FlexGridSizer6 = new wxFlexGridSizer(0, 2, 0, 0);
    Gauge1 = new wxGauge(Panel1, ID_GAUGE1, 100, wxDefaultPosition, wxSize(155,28), 0, wxDefaultValidator, _T("ID_GAUGE1"));
    FlexGridSizer6->Add(Gauge1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticText13 = new wxStaticText(Panel1, ID_STATICTEXT13, _("Menunggu Data"), wxDefaultPosition, wxSize(79,23), 0, _T("ID_STATICTEXT13"));
    FlexGridSizer6->Add(StaticText13, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    Button4 = new wxButton(Panel1, ID_BUTTON4, _("Kirim Data!"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON4"));
    FlexGridSizer6->Add(Button4, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    Button5 = new wxButton(Panel1, ID_BUTTON5, _("Label"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON5"));
    FlexGridSizer6->Add(Button5, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticBoxSizer6->Add(FlexGridSizer6, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 0);
    FlexGridSizer1->Add(StaticBoxSizer6, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 0);
    StaticBoxSizer2 = new wxStaticBoxSizer(wxHORIZONTAL, Panel1, _("Manual"));
    FlexGridSizer2 = new wxFlexGridSizer(0, 2, 0, 0);
    StaticText1 = new wxStaticText(Panel1, ID_STATICTEXT1, _("X"), wxDefaultPosition, wxDefaultSize, 0, _T("ID_STATICTEXT1"));
    FlexGridSizer2->Add(StaticText1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    TextCtrl1 = new wxTextCtrl(Panel1, ID_TEXTCTRL1, wxEmptyString, wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_TEXTCTRL1"));
    FlexGridSizer2->Add(TextCtrl1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticText2 = new wxStaticText(Panel1, ID_STATICTEXT2, _("Y"), wxDefaultPosition, wxDefaultSize, 0, _T("ID_STATICTEXT2"));
    FlexGridSizer2->Add(StaticText2, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    TextCtrl2 = new wxTextCtrl(Panel1, ID_TEXTCTRL2, wxEmptyString, wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_TEXTCTRL2"));
    FlexGridSizer2->Add(TextCtrl2, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    Button1 = new wxButton(Panel1, ID_BUTTON1, _("Set"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON1"));
    FlexGridSizer2->Add(Button1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    Button3 = new wxButton(Panel1, ID_BUTTON3, _("Reset All"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON3"));
    FlexGridSizer2->Add(Button3, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticBoxSizer2->Add(FlexGridSizer2, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    FlexGridSizer1->Add(StaticBoxSizer2, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticBoxSizer4 = new wxStaticBoxSizer(wxHORIZONTAL, Panel1, _("Kordinat"));
    StaticBoxSizer3 = new wxStaticBoxSizer(wxHORIZONTAL, Panel1, _("Start"));
    FlexGridSizer3 = new wxFlexGridSizer(0, 2, 0, 0);
    StaticText3 = new wxStaticText(Panel1, ID_STATICTEXT3, _("X"), wxDefaultPosition, wxDefaultSize, 0, _T("ID_STATICTEXT3"));
    FlexGridSizer3->Add(StaticText3, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticText4 = new wxStaticText(Panel1, ID_STATICTEXT4, wxEmptyString, wxDefaultPosition, wxSize(81,13), 0, _T("ID_STATICTEXT4"));
    FlexGridSizer3->Add(StaticText4, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticText5 = new wxStaticText(Panel1, ID_STATICTEXT5, _("Y"), wxDefaultPosition, wxDefaultSize, 0, _T("ID_STATICTEXT5"));
    FlexGridSizer3->Add(StaticText5, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticText6 = new wxStaticText(Panel1, ID_STATICTEXT6, wxEmptyString, wxDefaultPosition, wxSize(58,13), 0, _T("ID_STATICTEXT6"));
    FlexGridSizer3->Add(StaticText6, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticBoxSizer3->Add(FlexGridSizer3, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 0);
    StaticBoxSizer4->Add(StaticBoxSizer3, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticBoxSizer5 = new wxStaticBoxSizer(wxHORIZONTAL, Panel1, _("Tujuan"));
    FlexGridSizer4 = new wxFlexGridSizer(0, 2, 0, 0);
    StaticText7 = new wxStaticText(Panel1, ID_STATICTEXT7, _("X"), wxDefaultPosition, wxDefaultSize, 0, _T("ID_STATICTEXT7"));
    FlexGridSizer4->Add(StaticText7, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticText8 = new wxStaticText(Panel1, ID_STATICTEXT8, wxEmptyString, wxDefaultPosition, wxSize(71,13), 0, _T("ID_STATICTEXT8"));
    FlexGridSizer4->Add(StaticText8, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticText9 = new wxStaticText(Panel1, ID_STATICTEXT9, _("Y"), wxDefaultPosition, wxDefaultSize, 0, _T("ID_STATICTEXT9"));
    FlexGridSizer4->Add(StaticText9, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticText10 = new wxStaticText(Panel1, ID_STATICTEXT10, wxEmptyString, wxDefaultPosition, wxDefaultSize, 0, _T("ID_STATICTEXT10"));
    FlexGridSizer4->Add(StaticText10, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    StaticBoxSizer5->Add(FlexGridSizer4, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 0);
    StaticBoxSizer4->Add(StaticBoxSizer5, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    FlexGridSizer1->Add(StaticBoxSizer4, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    BoxSizer3 = new wxBoxSizer(wxVERTICAL);
    Choice1 = new wxChoice(Panel1, ID_CHOICE1, wxDefaultPosition, wxDefaultSize, 0, 0, 0, wxDefaultValidator, _T("ID_CHOICE1"));
    Choice1->Append(_("Start"));
    Choice1->Append(_("Tujuan"));
    Choice1->Append(_("Penghalang"));
    BoxSizer3->Add(Choice1, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    Button2 = new wxButton(Panel1, ID_BUTTON2, _("Go Pathfinding!"), wxDefaultPosition, wxDefaultSize, 0, wxDefaultValidator, _T("ID_BUTTON2"));
    BoxSizer3->Add(Button2, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    FlexGridSizer1->Add(BoxSizer3, 1, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    BoxSizer2->Add(FlexGridSizer1, 0, wxALL|wxEXPAND|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 5);
    Panel1->SetSizer(BoxSizer2);
    BoxSizer2->Fit(Panel1);
    BoxSizer2->SetSizeHints(Panel1);
    BoxSizer1->Add(Panel1, 1, wxALL|wxALIGN_CENTER_HORIZONTAL|wxALIGN_CENTER_VERTICAL, 0);
    SetSizer(BoxSizer1);
    MenuBar1 = new wxMenuBar();
    Menu1 = new wxMenu();
    MenuItem1 = new wxMenuItem(Menu1, idMenuQuit, _("Quit\tAlt-F4"), _("Quit the application"), wxITEM_NORMAL);
    Menu1->Append(MenuItem1);
    MenuBar1->Append(Menu1, _("&File"));
    Menu2 = new wxMenu();
    MenuItem2 = new wxMenuItem(Menu2, idMenuAbout, _("About\tF1"), _("Show info about this application"), wxITEM_NORMAL);
    Menu2->Append(MenuItem2);
    MenuBar1->Append(Menu2, _("Help"));
    SetMenuBar(MenuBar1);
    StatusBar1 = new wxStatusBar(this, ID_STATUSBAR1, 0, _T("ID_STATUSBAR1"));
    int __wxStatusBarWidths_1[1] = { -1 };
    int __wxStatusBarStyles_1[1] = { wxSB_NORMAL };
    StatusBar1->SetFieldsCount(1,__wxStatusBarWidths_1);
    StatusBar1->SetStatusStyles(1,__wxStatusBarStyles_1);
    SetStatusBar(StatusBar1);
    BoxSizer1->Fit(this);
    BoxSizer1->SetSizeHints(this);

    Connect(ID_GRID1,wxEVT_GRID_CELL_LEFT_CLICK,(wxObjectEventFunction)&tesgridFrame::OnGrid1CellLeftClick);
    Connect(ID_GRID1,wxEVT_GRID_CELL_RIGHT_CLICK,(wxObjectEventFunction)&tesgridFrame::OnGrid1CellRightClick);
    Connect(ID_RADIOBUTTON2,wxEVT_COMMAND_RADIOBUTTON_SELECTED,(wxObjectEventFunction)&tesgridFrame::OnRadioButton2Select);
    Connect(ID_BUTTON4,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&tesgridFrame::OnButton4Click);
    Connect(ID_BUTTON5,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&tesgridFrame::OnButton5Click);
    Connect(ID_BUTTON1,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&tesgridFrame::OnButton1Click);
    Connect(ID_BUTTON3,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&tesgridFrame::OnButton3Click);
    Connect(ID_CHOICE1,wxEVT_COMMAND_CHOICE_SELECTED,(wxObjectEventFunction)&tesgridFrame::OnChoice1Select);
    Connect(ID_BUTTON2,wxEVT_COMMAND_BUTTON_CLICKED,(wxObjectEventFunction)&tesgridFrame::OnButton2Click);
    Connect(idMenuQuit,wxEVT_COMMAND_MENU_SELECTED,(wxObjectEventFunction)&tesgridFrame::OnQuit);
    Connect(idMenuAbout,wxEVT_COMMAND_MENU_SELECTED,(wxObjectEventFunction)&tesgridFrame::OnAbout);
//    Connect(wxID_ANY,wxEVT_CLOSE_WINDOW,(wxObjectEventFunction)&tesgridFrame::OnClose);
    //*)
}

tesgridFrame::~tesgridFrame()
{
    //(*Destroy(tesgridFrame)
    //*)
}

void tesgridFrame::OnQuit(wxCommandEvent& event)
{
    Destroy();
}


void tesgridFrame::OnAbout(wxCommandEvent& event)
{
    wxString msg = wxbuildinfo(long_f);
    wxMessageBox(msg, _("Welcome to..."));
}

int s_currect_row,s_currect_col;
int g_currect_row,g_currect_col;
int p_currect_row,p_currect_col;
int num1rec0, num2rec0;
int num1rec1, num2rec1;
//wxString xs,ys,xt,yt;
wxColour newcolor;

#include <boost/asio.hpp> // include boost
using namespace::boost::asio;  // save tons of typing

#include "winsock2.h"
using std::cin;
using std::cout;
using std::string;
using std::endl;
using std::list;

// These are the values our port needs to connect
#ifdef _WIN32
// windows uses com ports, this depends on what com port your cable is plugged in to.
	const char *PORT = "COM6";
#else
// *nix com ports
	const char *PORT = "dev/ttyS3";
#endif
// Note: all the following except BAUD are the exact same as the default values

// what baud rate do we communicate at
serial_port_base::baud_rate BAUD(9600);
// how big is each "packet" of data (default is 8 bits)
serial_port_base::character_size CSIZE( 8 );
// what flow control is used (default is none)
serial_port_base::flow_control FLOW( serial_port_base::flow_control::none );
// what parity is used (default is none)
serial_port_base::parity PARITY( serial_port_base::parity::none );
// how many stop bits are used (default is one)
serial_port_base::stop_bits STOP( serial_port_base::stop_bits::one );

//string tempstr1;
string tempstr2;
string cmd;
 string concat (string A1, string A2){
    return A1+A2;
    }


//wxPoint* absolt;
list <wxPoint> points;
int MapX, MapY;
//list<char*> orlist;
//typedef int map[5][6];
int x,y,p,q,f,g,h,i;
int P,Q,X,Y;
int tempe = -1;
int tempr = -1;
/*
string tempstr1;
string tempstr2;

 string concat (string A1, string A2){
    return A1+A2;
    }*/
//Connection *connection = new Bluetooth();

//list<char*> orlist;

struct Struktur{

int A[8][8];
int O[8][8];
};

Struktur S;
list<char*> orlist,orlist2;
int xs,ys,xt,yt;
    wxString array[7][7];
char* ortemp;
void tesgridFrame::OnGrid1CellLeftClick(wxGridEvent& event)
{
if ((event.GetRow() == xs && event.GetCol() == ys)&&
             ((orlist.front() == ">")||(orlist.front() == "^")||
        (orlist.front() == "v")||(orlist.front() == "<"))){
        wxMessageBox(_("Titik start tidak bisa ditimpali"));
        event.Skip();}



 //xs = StaticText4->GetLabel();
 //ys = StaticText6->GetLabel();
 //xt = StaticText8->GetLabel();
 //yt = StaticText10->GetLabel();


     if (Choice1->GetCurrentSelection() == 0)
     {  Grid1->ClearGrid();
         wxString xs,ys;
         StaticText4->SetLabel(xs<<event.GetRow());
         StaticText6->SetLabel(ys<<event.GetCol());

         if (num1rec0 != -1 && num2rec0 != -1)
        {
        Grid1->SetCellBackgroundColour(num1rec0, num2rec0, *wxWHITE);
        }
        num1rec0 = event.GetRow();
        num2rec0 = event.GetCol();
        if (num1rec0 != -1 && num2rec0 != -1){
        Grid1->SetCellBackgroundColour(num1rec0, num2rec0, newcolor);
                                            }
     }

     if (Choice1->GetCurrentSelection() == 1)
     {
         //if ((event.GetRow() != -1 && event.GetCol() != -1)
            // || (Grid1->GetCellBackgroundColour(event.GetRow(), event.GetCol())  == *wxGREEN)
          //  && (orlist.front()== "")){
         Grid1->ClearGrid();
        wxString xt,yt;
       StaticText8->SetLabel(xt<<event.GetRow());
       StaticText10->SetLabel(yt<<event.GetCol());

       if ((num1rec1 != -1 && num2rec1 != -1) && (Grid1->GetCellBackgroundColour(num1rec1, num2rec1)  == *wxRED))
        {
        Grid1->SetCellBackgroundColour(num1rec1, num2rec1, *wxWHITE);
        }
        num1rec1 = event.GetRow();
        num2rec1 = event.GetCol();
        if (num1rec1 != -1 && num2rec1 != -1){
        Grid1->SetCellBackgroundColour(num1rec1, num2rec1, newcolor);
                                            }
     }
    if (Choice1->GetCurrentSelection() == 2)
        {   Grid1->ClearGrid();
      if( newcolor == *wxLIGHT_GREY && p_currect_row!=-1 && p_currect_col!=-1 )
            {
      p_currect_row = event.GetRow();
      p_currect_col = event.GetCol();
      Grid1->SetCellBackgroundColour(p_currect_row, p_currect_col, newcolor);
            }
        }
     //}
     //wxMessageBox(_());
//if (event.GetRow() == xs&& event.GetCol() == ys){
}

//Fungsi untuk menghilangkan titik di grid
void tesgridFrame::OnGrid1CellRightClick(wxGridEvent& event){



    if (Choice1->GetCurrentSelection() == 0){
         if (event.GetRow() != -1 && event.GetCol()!= -1){
        Grid1->ClearGrid();
        StaticText4->SetLabel(_(""));
        StaticText6->SetLabel(_(""));
        Grid1->SetCellBackgroundColour(event.GetRow(), event.GetCol(), *wxWHITE);}}

    if ((Choice1->GetCurrentSelection() == 1)&&
        (Grid1->GetCellBackgroundColour(event.GetRow(),event.GetCol()) == *wxRED)){
         if (event.GetRow() != -1 && event.GetCol()!= -1){
        Grid1->ClearGrid();
        StaticText8->SetLabel(_(""));
        StaticText10->SetLabel(_(""));
        Grid1->SetCellBackgroundColour(event.GetRow(), event.GetCol(), *wxWHITE);}}

    if ((Choice1->GetCurrentSelection() == 2)&&
        (Grid1->GetCellBackgroundColour(event.GetRow(),event.GetCol()) == *wxLIGHT_GREY)){
     if (event.GetRow() != -1 && event.GetCol()!= -1)
    {
        Grid1->ClearGrid();
        Grid1->SetCellBackgroundColour(event.GetRow(), event.GetCol(), *wxWHITE);}
    }


 }

void tesgridFrame::OnChoice1Select(wxCommandEvent& event)
{
  if  ((Choice1->GetCurrentSelection() == 0) &&
       ((orlist.front() == ">")||(orlist.front() == "^")||
        (orlist.front() == "v")||(orlist.front() == "<")))
      // StaticText12->GetLabel() == _("Berhenti"))
  {wxMessageBox(_("Tidak dapat memilih titik start lagi"));
   Choice1->SetSelection(-1);
   }
  if (Choice1->GetCurrentSelection() == 0) newcolor = *wxGREEN;
  if (Choice1->GetCurrentSelection() == 1) newcolor = *wxRED;
  if (Choice1->GetCurrentSelection() == 2) newcolor = *wxLIGHT_GREY;
  /*switch (Choice1->GetCurrentSelection()){
  case 0 : newcolor = *wxGREEN;
  case 1 : newcolor = *wxRED;
  }*/
}


void tesgridFrame::OnButton1Click(wxCommandEvent& event)
{
int num1,num2;
wxString mx,my;
mx = TextCtrl1->GetValue();
my = TextCtrl2->GetValue();

num1 = wxAtoi(mx);
num2 = wxAtoi(my);
Grid1->ClearGrid();
    if (Choice1->GetCurrentSelection() == 0)
    {
        StaticText4->SetLabel(mx);
        StaticText6->SetLabel(my);

        if (num1rec0 != -1 && num2rec0 != -1)
        {
            Grid1->SetCellBackgroundColour(num1rec0, num2rec0, *wxWHITE);
        }
        num1rec0 = num1;
        num2rec0 = num2;
        if (num1rec0 != -1 && num2rec0 != -1){
        Grid1->SetCellBackgroundColour(num1rec0, num2rec0, newcolor);}
    }

    if (Choice1->GetCurrentSelection() == 1)
    {
        StaticText8->SetLabel(mx);
        StaticText10->SetLabel(my);

        if (num1rec1 != -1 && num2rec1 != -1)
        {
            if (Grid1->GetCellBackgroundColour(num1rec1, num2rec1) == *wxRED)
        Grid1->SetCellBackgroundColour(num1rec1, num2rec1, *wxWHITE);
        }
        num1rec1 = num1;
        num2rec1 = num2;
        if (num1rec1 != -1 && num2rec1 != -1){
        Grid1->SetCellBackgroundColour(num1rec1, num2rec1, newcolor);}
    }
    //Layout();
}
//Mencari nilai heuristik dari tiap koordinat.
//Dengan masukan koordinat open list dan titik target.
//Menghitung jaraknya, dan mengeluarkan output nilai heuristik
int Heuristic(int m,int n,int u, int v)
{
    int temp1=0;
    int temp2=0;
    int H=0;

            if (u<m){
            temp1 = u;
            u = m;
            m = temp1; }


            if (v<n){
            temp2 = v;
            v = n;
            n = temp2; }


            H = ((u-m)+(v-n))*10;
           // PrintMatrix2(*S.O, 30);


            return H;
}
int s,t;
//Mencari nilai minimum dari semua koordinat
int  Min(int *B, int l){

 int   temp = 999;
                for (s=0; s<MapX; s++)
                {

                    for (t=0; t<MapY; t++)
                    {



            if ((S.A[s][t] % 10 == 0) &&(S.A[s][t]>0) && (S.A[s][t] < temp))
            {
            temp = S.A[s][t];

                }


                    }
                }

                return temp;
}

int  Min2(){
int   tempo = 999;

                for (s=0; s<MapX; s++)
                {

                    for (t=0; t<MapY; t++)
                    {
            if ((S.O[s][t] % 10 == 0) &&(S.O[s][t]>0) && (S.O[s][t] < tempo))
            {
            tempo = S.O[s][t];

                }
                    }
                }
               // cout<<tempo<<endl;
                return tempo;
}

void UpdateSO(int e, int r){
        if ((tempe != -1) && (tempr != -1)){

        if ((tempe - e == 0) && (tempr - r == -1 )){ orlist.push_front("<");
      //  cout<<"<"<<endl;
      }
   else if ((tempe - e == 1) && (tempr - r == 0 )) {orlist.push_front("v");
      //  cout<<"v"<<endl;
      }
   else if ((tempe - e == -1) && (tempr - r == 0 )) {orlist.push_front("^");
     //   cout<<"^"<<endl;
     }
   else if ((tempe - e == 0) && (tempr - r == 1 )) {orlist.push_front(">");
     //   cout<<">"<<endl;
     }
        }

    tempe = e;
    tempr = r;
}

void tesgridFrame::OnButton2Click(wxCommandEvent& event)
{

         MapX = 7;
    MapY = 7;
      S.A =
        {{0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0}};

    xs = wxAtoi(StaticText4->GetLabel());
    ys = wxAtoi(StaticText6->GetLabel());
    xt = wxAtoi(StaticText8->GetLabel());
    yt = wxAtoi(StaticText10->GetLabel());


//S.A[xs][ys] = 45;


S.A[xs][ys] = 15;
S.A[xt][yt] = 25;



S.A[xs][ys] = 45;
Mulai:
 for( x = 0; x<MapX; x++){
        for( y = 0; y<MapY; y++){
        if (Grid1->GetCellBackgroundColour(x,y) == *wxLIGHT_GREY)
            S.A[x][y] = 35;

        }}

if (StaticText12->GetLabel() == _("Berhenti")){
    if (strcmp(ortemp,">")==0) S.A[xs][ys-1] = 35;
    else if (strcmp(ortemp,"^")==0) S.A[xs+1][ys] = 35;
    else if (strcmp(ortemp,"v")==0) S.A[xs-1][ys] = 35;
    else if (strcmp(ortemp,"<")==0) S.A[xs][ys+1] = 35;}
/*
    for (x=0; x<MapX; x++)
    {
        for (y=0; y<MapY; y++)
        {
//Cari Titik Target di Matrix, Bila ditemukan:
            if (S.A[x][y] == 25)
                { goto KotakTetangga;
                }

        }
    }
*/
   if (S.A[xt][yt] == 25){goto KotakTetangga;}

                KotakTetangga:

 for (p=0; p<MapX; p++)
                {

                    for (q=0; q<MapY; q++)
                    {
  //Cari Titik Referensi di Matrix, Bila ditemukan:
                        if (S.A[p][q] == 45)
                        {
                            //set Titik Referensi menjadi closed list
                             S.A[p][q] = 5;
//Masukkan tetangga-tetangga dari titik referensi (atas, bawah, kanan,
//kiri kedalam open list.
                             //Cari Nilai heuristik TR kiri
  //Lainnya, Jika tetangga = unwalkable/closed list/titik referensi, hiraukan.
                        if ((S.A[p][q-1]!=45)&& ((q-1) >= 0 ) &&
                            (S.A[p][q-1]!=35)&&(S.A[p][q-1]!=5)){

                             S.A[p][q-1]=Heuristic(p,(q-1),xt,yt);
  //Jika titik target masuk kedalam closed list, maka path telah ditemukan.
                             if (S.A[p][q-1]==0){

                                //    UpdateSO(P,Q);
                                    goto Selesai;
                             }

                             }

                            //Cari Nilai heuristik TR atas
                        if ((S.A[p-1][q]!=45)&& ((p-1) >= 0) &&
                            (S.A[p-1][q]!=35)&&(S.A[p-1][q]!=5)){

                             S.A[p-1][q]=Heuristic((p-1),q,xt,yt);
                             if ( S.A[p-1][q]==0) {
                                   //UpdateSO(P,Q);
                                    goto Selesai;}
                             }

                            //Cari Nilai heuristik TR kanan
                        if ((S.A[p][q+1]!=45)&&
                            (S.A[p][q+1]!=35)&&(S.A[p][q+1]!=5)){
                             S.A[p][q+1]=Heuristic(p,(q+1),xt,yt);

                             if ( S.A[p][q+1]== 0) {
                              //  UpdateSO(P,Q);
                                goto Selesai;
                             }
                             }

                            //Cari Nilai heuristik TR bawah
                        if ((S.A[p+1][q]!=45)&&
                            (S.A[p+1][q]!=35)&&(S.A[p+1][q]!=5)){
                             S.A[p+1][q]=Heuristic((p+1),q,xt,yt);
                                if ( S.A[p+1][q]== 0){
                                //UpdateSO(P,Q);
                                goto Selesai;
                                }
                                }
                        }
                    }
                }

//Mencari Nilai terkecil dan menjadikannya titik referensi
               for (f=0; f<MapX; f++){
                for (g=0; g<MapY; g++)
                {
                    if (S.A[f][g] == Min(*S.A, MapX*MapY))
                    {

                     S.A[f][g]=45;
                     p = f;
                     q = g;
                   //  UpdateSO(f, g);
                     goto Mulai;
                    }
                                }
                            }
Selesai:

/*
//Jika Failed, fungsi tidak dijalankan.
            for (h=0; h<MapX; h++){
                for (i=0; i<MapY; i++)
                { if (S.A[h][i] == 25 )



                }
            }
*/
//Hilangkan semua penghalang dan open list, sehingga hanya closed list
//yang tersisa
 for (x=0; x<MapX; x++)
    {
        for (y=0; y<MapY; y++)
        { if (S.A[x][y] != 5) S.A[x][y] = 0;}
    }

//Inisialisasi matriks baru untuk konfirmasi, dan akan menjadi path list
         S.O =
        {{0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0}};
P = xt;
Q = yt;
X = xs;
Y = ys;
tempe = xt;
tempr = yt;
    Start:
//Working Backwards. Konfirmasi ulang dengan melakukan pathfinding dari
//target ke start.

     S.O[P][Q] = 999;
     if ((S.A[P][Q-1] == 5) && ((Q-1) >= 0)) {
         S.O[P][Q-1] = Heuristic(P, (Q-1), X, Y);
         }
        if ((P == X) && ((Q-1) == Y))
        {   //UpdateSO(P,Q);
            goto End;}

         if ((S.A[P-1][Q] == 5) && ((P-1) >= 0)) {
             S.O[P-1][Q] = Heuristic((P-1), Q, X, Y);
             }
         if (((P-1) == X) && (Q == Y)) {
            // UpdateSO(P,Q);
             goto End;}

         if ((S.A[P][Q+1] == 5) && ((Q+1) <= 6)) {
             S.O[P][Q+1] = Heuristic(P, (Q+1), X, Y);
             }
        if ((P == X) && ((Q+1) == Y)) {
            //UpdateSO(P,Q);
            goto End;}

         if ((S.A[P+1][Q] == 5) && ((P+1) <= 6)) {
             S.O[P+1][Q] = Heuristic((P+1),Q,  X, Y);
             }
        if (((P+1) == X) && (Q == Y)) {
           // UpdateSO(P,Q);
            goto End;}

                for ( x = 0;x<MapX; x++){
                for( y = 0; y<MapY; y++){
                    if (S.O[x][y] == Min2()){
                        P = x;
                        Q = y;
                        S.A[P][Q] = 4;
                        UpdateSO(P,Q);
                   goto Start;
                    }
                  }
                }
End:
/*
for(int x = 0; x<MapX; x++){
        for(int y = 0; y<MapY; y++){
            array[x][y]<<S.A[x][y];
       //                  Grid1->ClearGrid();
    //if ( x != -1 && y != -1)
    //{
        Grid1->SetCellValue(x,y,array[x][y]);
   // }
        }
}
*/






//tambahan arahan orientasi dari titik awal
    if (S.O[X-1][Y] == 999) orlist.push_front ("^");
    if (S.O[X][Y+1] == 999) orlist.push_front (">");
    if (S.O[X+1][Y] == 999) orlist.push_front ("v");
    if (S.O[X][Y-1] == 999) orlist.push_front ("<");

//Tambahkan elemen yang sama agar dari titik start bisa langsung maju
    if (StaticText12->GetLabel() == _("Berhenti")){
   orlist.push_front(ortemp);
    //UpdateSO(xs,ys);
    }

if (StaticText12->GetLabel() == _(""))
    {
        if (strcmp(orlist.front(), "^")== 0) orlist.push_front ("^");
        else if (strcmp(orlist.front(), ">")== 0) orlist.push_front (">");
        else if (strcmp(orlist.front(), "v")== 0) orlist.push_front ("v");
        else if (strcmp(orlist.front(), "<")== 0) orlist.push_front ("<");

    }
/*
    if (S.O[xs-1][ys] == 999) orlist.push_back ("v");
    if (S.O[xs][ys+1] == 999) orlist.push_back (">");
    if (S.O[xs+1][ys] == 999) orlist.push_back ("^");
    if (S.O[xs][ys-1] == 999) orlist.push_front ("<");*/
//Paint Grid berdasarkan jalur grid yang sudah terbuat
wxPoint pt;
      for(x = 0; x<MapX; x++){
        for(int y = 0; y<MapY; y++){
            if(S.A[x][y] == 4){
                array[x][y]<<S.A[x][y];
                pt.x = x;
                pt.y = y;
                points.push_back(pt);
                Grid1->ClearGrid();
    if ( x != -1 && y != -1)
    {
    Grid1->SetCellBackgroundColour(x, y, *wxBLUE);
    }
    }

        }//fory
      }//for x


if ((StaticText8->GetLabel() == _("")) && (StaticText10->GetLabel() == _(""))){
     wxMessageBox(_("Tentukan dulu titik tujuan"));
         for( x = 0; x<MapX; x++){
        for( y = 0; y<MapY; y++){
          if (( x != -1 && y != -1) && (Grid1->GetCellBackgroundColour(x,y) == *wxBLUE))
                {
            Grid1->ClearGrid();
            Grid1->SetCellBackgroundColour(x, y, *wxWHITE);
                }}}
                orlist.clear();}

Choice1->SetSelection(-1);


}


void tesgridFrame::OnButton3Click(wxCommandEvent& event)
{
//mereset semua koordinat yang ada tertulis di label
    if (StaticText12->GetLabel() != _("Berhenti")){
    StaticText4->SetLabel(_(""));
    StaticText6->SetLabel(_(""));}
    StaticText8->SetLabel(_(""));
    StaticText10->SetLabel(_(""));
    for(int x = 0; x<MapX; x++){
        for(int y = 0; y<MapY; y++){

                         Grid1->ClearGrid();
    if (( x != -1 && y != -1) && (Grid1->GetCellBackgroundColour(x,y) != *wxGREEN))
    {
            Grid1->SetCellBackgroundColour(x, y, *wxWHITE);
    }
    }

        }//fory
      //for x
}

int xtemp, ytemp;
int ig;


void tesgridFrame::OnRadioButton2Select(wxCommandEvent& event)
{

    io_service io;
	// create the serial device, note it takes the io service and the port name
	serial_port port( io, PORT );

	// go through and set all the options as we need them
	// all of them are listed, but the default values work for most cases
	port.set_option( BAUD );
	port.set_option( CSIZE );
	port.set_option( FLOW );
	port.set_option( PARITY );
	port.set_option( STOP );
RadioButton2->SetValue(true);




	// buffer to store commands
	// this device reads 8 bits, meaning an unsigned char, as instructions
	// varies with the device, check the manual first
	unsigned char command[1] = {0};
command[0] = static_cast<char>( '0' );
        write( port, buffer(command, 2 ));
        //Sleep (100);

//    unsigned char command[1] = {0};
char c;
    //read( port, buffer( &command, 2 ) );
    read( port, buffer( &c, 1 ) );
//string read;
//    &read = command[1];
      //  read = c;
        //const char* read;
        //read = c;

wxString iterwxs;

//orlist2.pop_front();//menghilangkan elemen pertama orlist2. elemen pertama orlist berfungsi untuk melakukan pergerakan segera.
list<char*>::iterator iters = orlist2.begin();
//iters = orlist.();
//while(iter != orlist.end()){


      while (c != '0'){//lakukan sampai program menerima fungsi berhenti dari robot.
          if (c!= '4'){   //kode 4 anti trigger
             // if (iters != orlist.end()){
             //Fungsi untuk mengetahui arah orientasi apa saja yang dikirim

              orlist2.front() = *iters;
              //for (iters=orlist.begin(); iters!=orlist.end(); iters++){
        wxString conv (orlist2.front(), wxConvUTF8);
        wxTheApp->Yield();
        StaticText11->SetLabel(iterwxs<<conv);



              Grid1->ClearGrid();
if ( xs != -1 && ys != -1)
   Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);
     // wxString  readstr;
              wxString xtrans, ytrans;
StaticText4->SetLabel(xtrans<<xs);
StaticText6->SetLabel(ytrans<<ys);

          wxTheApp->Yield();
      if (c == '1') {
          StaticText12->SetLabel(_("Maju"));
          if (strcmp(orlist2.front(),">")==0){ys = ys+1;}
          else if (strcmp(orlist2.front(),"v")==0){xs = xs+1;}
          else if (strcmp(orlist2.front(),"<")==0){ys = ys-1;}
          else if (strcmp(orlist2.front(),"^")==0){xs = xs-1;}
          //wxSleep(1);
          }

          //readstr = _("Maju"); wxSleep(1);}
      else if (c == '2') {
        StaticText12->SetLabel(_("Kanan"));
          if (strcmp(orlist2.front(),">")==0){xs = xs+1;}
          else if (strcmp(orlist2.front(),"v")==0){ys = ys-1;}
          else if (strcmp(orlist2.front(),"<")==0){xs = xs-1;}
          else if (strcmp(orlist2.front(),"^")==0){ys = ys+1;}

         // wxSleep(3);
      }
          //readstr = _("Kanan"); wxSleep(1);}
      else if (c == '3') {
        StaticText12->SetLabel(_("Kiri"));
        if (strcmp(orlist2.front(),">")==0){xs = xs-1;}
          else if (strcmp(orlist2.front(),"v")==0){ys = ys+1;}
          else if (strcmp(orlist2.front(),"<")==0){xs = xs+1;}
          else if (strcmp(orlist2.front(),"^")==0){ys = ys-1;}
          //wxSleep(3);

          //readstr = _("Kiri");wxSleep(1);}
      //StaticText12->SetLabel(readstr);
      }
      Grid1->ClearGrid();
      if ( xs != -1 && ys != -1)
            Grid1->SetCellBackgroundColour(xs, ys, *wxGREEN);
          wxTheApp->Yield();

        ++iters;
//}
//}
}
       read( port, buffer( &c, 1 ) );

}
      //wxTheApp->Yield();
      ortemp = orlist.back();
        orlist.clear();
        orlist2.clear();
      StaticText12->SetLabel(_("Berhenti"));
      wxString xtrans, ytrans;
StaticText4->SetLabel(xtrans<<xt);
StaticText6->SetLabel(ytrans<<yt);
StaticText8->SetLabel(_(""));
StaticText10->SetLabel(_(""));
StaticText13->SetLabel(_("Menunggu data"));
Gauge1->SetValue(0);
RadioButton1->SetValue(true);
        //= _("baa");
       // unsigned char *read;
        //read = &static_cast<char>(command[1]);
      //  wxString readstr = wxString::FromUTF8(read);
//            wxString readstr(read.c_str(), wxConvUTF8);
        // readstr(read.c_str(), wxCoreadstr(read.c_str(), wxConvUTF8)nvUTF8);
       // wxString readst;
       // readst = _("has");
        //wxTheApp->Yield();
       // StaticText12->SetLabel(_("haslo"));



/*
         while (StaticText12->GetLabel() != _("Berhenti"))
        {
            wxTheApp->Yield();
            read( port, buffer( command, 2 ) );
        wxString readstr;
        StaticText13->SetLabel(readstr<<command[0]);

        Grid1->ClearGrid();
if ( xs != -1 && ys != -1){
    Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);
    if ((Grid1->GetCellBackgroundColour(xs+1, ys) == *wxBLUE)||
        (Grid1->GetCellBackgroundColour(xs+1, ys) == *wxRED))
        {
            xs = xs+1;
            ys = ys;
        }
     else if ((Grid1->GetCellBackgroundColour(xs-1, ys) == *wxBLUE)||
            (Grid1->GetCellBackgroundColour(xs-1, ys) == *wxRED))
        {
            xs = xs-1;
            ys = ys;
        }
     else if ((Grid1->GetCellBackgroundColour(xs, ys+1) == *wxBLUE)||
                (Grid1->GetCellBackgroundColour(xs, ys+1) == *wxRED))
        {
            ys = ys+1;
            xs = xs;
        }
     else if ((Grid1->GetCellBackgroundColour(xs, ys-1) == *wxBLUE)||
                (Grid1->GetCellBackgroundColour(xs, ys-1) == *wxRED))
     {
            ys = ys-1;
            xs = xs;
     }

            //Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);
           // if ( xs != -1 && ys != -1){
            Grid1->SetCellBackgroundColour(xs, ys, *wxGREEN);
            wxString xtrans, ytrans;
            StaticText4->SetLabel(xtrans<<xs);
            StaticText6->SetLabel(ytrans<<ys);
             Sleep(500);
             //}
    }
    //xs = xs+1;
    //ys = ys+1;
    }

StaticText8->SetLabel(_(""));
StaticText10->SetLabel(_(""));
*/


}

void tesgridFrame::OnButton4Click(wxCommandEvent& event)
{

io_service io;
	// create the serial device, note it takes the io service and the port name
	serial_port port( io, PORT );

	// go through and set all the options as we need them
	// all of them are listed, but the default values work for most cases
	port.set_option( BAUD );
	port.set_option( CSIZE );
	port.set_option( FLOW );
	port.set_option( PARITY );
	port.set_option( STOP );

	// buffer to store commands
	// this device reads 8 bits, meaning an unsigned char, as instructions
	// varies with the device, check the manual first
	unsigned char command[1] = {0};


/*
   list<wxPoints>::iterator iter = orlist.begin();

        while(iter != orlist.end())
        {
            //*ptr = points.front();

           //Grid1->SetCellValue(iter->x,iter->y,array[iter->x][iter->y]);
           //wxMessageBox((iter);
           StaticText3->SetLabel(iter);
           iter++;
        }*/


//Tambahkan elemen yang sama agar dari titik start bisa langsung maju
string tempstr1;
wxString iterwx;
list<char*>::iterator iter = orlist.begin();
iter = orlist.begin();
while(iter != orlist.end()){
orlist.front() = *iter;
/*
        if  (Grid1->GetCellBackgroundColour(xs,(ys-1)) == *wxBLUE)
        {   Grid1->ClearGrid();
            if ((xs != -1) && ((ys-1) != -1)){
             Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);
            Grid1->SetCellBackgroundColour(xs,(ys-1), *wxGREEN);
            ys  = ys-1;
      //  cout<<"<"<<endl;
      }}
        if   (Grid1->GetCellBackgroundColour((xs-1),ys) == *wxBLUE)
        {   Grid1->ClearGrid();
            if (((xs-1) != -1) && (ys != -1)){
                Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);
            Grid1->SetCellBackgroundColour((xs-1),ys, *wxGREEN);
            xs = xs-1;
      //  cout<<"<"<<endl;
      }
      //jj
        }
        if  (Grid1->GetCellBackgroundColour(xs,(ys+1)) == *wxBLUE)
        {   Grid1->ClearGrid();
            if    ((xs != -1) && ((ys+1) != -1)){
                Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);
            Grid1->SetCellBackgroundColour(xs,(ys+1), *wxGREEN);
            ys = ys+1;
      //  cout<<"<"<<endl;
      }
      }
       if   (Grid1->GetCellBackgroundColour((xs+1),ys) == *wxBLUE)
        {   Grid1->ClearGrid();
            if (((xs+1) != -1) && (ys != -1)){
                Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);
            Grid1->SetCellBackgroundColour((xs+1),ys, *wxGREEN);
            xs = xs +1;
      //  cout<<"<"<<endl;
      }
        }

*/

        //Fungsi untuk mengetahui arah orientasi apa saja yang dikirim

        wxString conv (orlist.front(), wxConvUTF8);
        wxTheApp->Yield();
        StaticText11->SetLabel(iterwx<<conv);
        //concat(iterwx, wxT(orlist.front());
//Putar dulu baru maju
//mengirimkan pesan maju
if      ((concat (tempstr1, orlist.front()) == "^^") ||
        (concat (tempstr1, orlist.front()) == ">>") ||
        (concat (tempstr1, orlist.front()) == "vv") ||
        (concat (tempstr1, orlist.front()) == "<<"))
        {
            //StaticText12->SetLabel(_("Maju 1 unit"));
           // StaticText13->SetLabel(_("Maju 1 unit"));
     command[0] = static_cast< char>( 'O' );

      write( port, buffer( command, 2 ) );
        Sleep (100);

        //concat(cmd, "o");
       }
//mengirimkan pesan kanan
 if ((concat (tempstr1, orlist.front()) == "^>") ||
        (concat (tempstr1, orlist.front()) == ">v") ||
        (concat (tempstr1, orlist.front()) == "v<")||
        (concat (tempstr1, orlist.front()) == "<^"))
        {
            //StaticText13->SetLabel(_("Belok kanan"));

       command[0] = static_cast< char>( 'o' );
       write( port, buffer( command, 2 ) );
        Sleep (100);


        }
        //mengirimkan pesan kiri
else if ((concat (tempstr1, orlist.front()) == "<v") ||
        (concat (tempstr1, orlist.front()) == "v>") ||
        (concat (tempstr1, orlist.front()) == ">^") ||
        (concat (tempstr1, orlist.front()) == "^<"))
        {
          //  StaticText13->SetLabel(_("Belok kiri"));

            command[0] = static_cast< char>( '_' );

       write( port, buffer( command, 2 ) );
        //Sleep (100);

      Sleep (500);

      // concat(cmd, "_");
        }

/*
else if ((concat (tempstr1, orlist.front()) == "<>") ||
        (concat (tempstr1, orlist.front()) == "v^") ||
        (concat (tempstr1, orlist.front()) == "><") ||
        (concat (tempstr1, orlist.front()) == "^v"))
        {
            StaticText13->SetLabel(_("Putar"));
        Sleep (500);
        }
*/
       tempstr1 = orlist.front();
       orlist2.push_back(orlist.front());
ig = ig +10;
Gauge1->SetValue(ig);
iter++;

}
iter = orlist.begin();
orlist.front()= *iter;
Gauge1->SetValue(100);
StaticText13->SetLabel(_("Data Terkirim!"));
//ortemp = orlist.back();
//orlist.clear();

/*
    for(int x = 0; x<MapX; x++){
        for(int y = 0; y<MapY; y++){

                         Grid1->ClearGrid();
    if (( x != -1 && y != -1) && (Grid1->GetCellBackgroundColour(x,y) != *wxLIGHT_GREY))
    {
            Grid1->SetCellBackgroundColour(x, y, *wxWHITE);
    }
    }}
    if (xt != -1 && yt != -1) Grid1->SetCellBackgroundColour(xt, yt, *wxGREEN);

        //fory
      //for x

StaticText12->SetLabel(_("Berhenti"));
wxString xtrans, ytrans;
RadioButton1->SetValue(true);
//StaticText4->SetLabel(xtrans<<xt);
//StaticText6->SetLabel(ytrans<<yt);
//StaticText8->SetLabel(_(""));
//StaticText10->SetLabel(_(""));
*/
}

//Fungsi Manipulasi gerakan pada program
//read command
//string ab;
//ab = read (port, buffer (command, 2));
//if (StaticText10->GetLabel() == "Maju")

//bool absas;
/*
Simulasi:
    while (xs <=3){
        Grid1->ClearGrid();
if ( xs != -1 && ys != -1)
    {
            Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);
            Grid1->SetCellBackgroundColour(xs+1, ys+1, *wxGREEN);
             Sleep(1000);
    }
    xs = xs+1;
    ys = ys+1;
    }
    */
int xp,yp;

void tesgridFrame::OnButton5Click(wxCommandEvent& event)

{

//RadioButton1->SetValue(true);
 //  if (MOUSEEVENTF_LEFTUP == true){

     //event.Skip(true);
    //while ((xs!= xt)&& (ys!=yt)){
  while (Grid1->GetCellBackgroundColour(xt,yt)!= *wxGREEN){
//do{
wxString xtrans, ytrans;
StaticText4->SetLabel(xtrans<<xs);
StaticText6->SetLabel(ytrans<<ys);

Grid1->ClearGrid();
if ( xs != -1 && ys != -1)
   Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);


    if ((Grid1->GetCellBackgroundColour(xs+1, ys) == *wxBLUE)||//kanan
        (Grid1->GetCellBackgroundColour(xs+1, ys) == *wxRED))
        {
            xs = xs+1;
            ys = ys;
        }
     else if ((Grid1->GetCellBackgroundColour(xs-1, ys) == *wxBLUE)||//kiri
            (Grid1->GetCellBackgroundColour(xs-1, ys) == *wxRED))
        {
            xs = xs-1;
            ys = ys;
        }
     else if ((Grid1->GetCellBackgroundColour(xs, ys+1) == *wxBLUE)||//bawah
                (Grid1->GetCellBackgroundColour(xs, ys+1) == *wxRED))
        {
            ys = ys+1;
            xs = xs;
        }
     else if ((Grid1->GetCellBackgroundColour(xs, ys-1) == *wxBLUE)||//atas
                (Grid1->GetCellBackgroundColour(xs, ys-1) == *wxRED))
     {
            ys = ys-1;
            xs = xs;
     }

//Grid1->ClearGrid();
//if ( xp != -1 && yp != -1)
  //  Grid1->SetCellBackgroundColour(xp, yp, *wxWHITE);

            //Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);
            if ( xs != -1 && ys != -1)
            Grid1->SetCellBackgroundColour(xs, ys, *wxGREEN);


            Sleep(500);
            //xp = xs;
            //yp = ys;
             //}
wxTheApp->Yield();
    //xs = xs+1;
    //ys = ys+1;
    }
//    tesgridApp->Yield(false);
//}
//while (Grid1->GetCellBackgroundColour(xt,yt)!= *wxGREEN);
//while ((xs!= xt)&& (ys!=yt));
//while ((Grid1->GetCellBackgroundColour(xs-1,ys)!= *wxRED)||
  //      (Grid1->GetCellBackgroundColour(xs+1,ys)!= *wxRED)||
    //    (Grid1->GetCellBackgroundColour(xs,ys-1)!= *wxRED)||
      //  (Grid1->GetCellBackgroundColour(xs,ys+1)!= *wxRED));

 //if ( xs != -1 && ys != -1)  {
            //wxTheApp->Yield();
//Grid1->SetCellBackgroundColour(xs, ys, *wxWHITE);}
            //if (xt != -1 && yt != -1){
            //wxTheApp->Yield();
            //Grid1->SetCellBackgroundColour(xt, yt, *wxGREEN);}
//absas = true;
//wxTheApp->WakeUpIdle();
wxString xtrans, ytrans;
StaticText4->SetLabel(xtrans<<xt);
StaticText6->SetLabel(ytrans<<yt);
StaticText8->SetLabel(_(""));
StaticText10->SetLabel(_(""));
}


//if (absas == true){





