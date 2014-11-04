/***************************************************************
 * Name:      tesgridMain.h
 * Purpose:   Defines Application Frame
 * Author:     ()
 * Created:   2012-07-05
 * Copyright:  ()
 * License:
 **************************************************************/

#ifndef TESGRIDMAIN_H
#define TESGRIDMAIN_H

//(*Headers(tesgridFrame)
#include <wx/sizer.h>
#include <wx/stattext.h>
#include <wx/menu.h>
#include <wx/textctrl.h>
#include <wx/radiobut.h>
#include <wx/panel.h>
#include <wx/grid.h>
#include <wx/choice.h>
#include <wx/button.h>
#include <wx/frame.h>
#include <wx/gauge.h>
#include <wx/statusbr.h>
//*)
//#include "ai.h"
class tesgridFrame: public wxFrame
{
    public:

        tesgridFrame(wxWindow* parent,wxWindowID id = -1);
        virtual ~tesgridFrame();

    private:

        //(*Handlers(tesgridFrame)
        void OnQuit(wxCommandEvent& event);
        void OnAbout(wxCommandEvent& event);
        void OnGrid1CellRightClick(wxGridEvent& event);
        void OnGrid1CellLeftClick(wxGridEvent& event);
        void OnGrid1CellSelect(wxGridEvent& event);
        void OnChoice1Select(wxCommandEvent& event);
        void OnButton2Click(wxCommandEvent& event);
        void OnButton1Click(wxCommandEvent& event);
        void OnButton3Click(wxCommandEvent& event);
        void OnRadioButton2Select(wxCommandEvent& event);
        void OnButton4Click(wxCommandEvent& event);
        void OnButton5Click(wxCommandEvent& event);
        void OnToggleButton1Toggle(wxCommandEvent& event);
                void OnClose(wxCloseEvent& event);
        //*)
        //void DrawCell( wxDC& dc, const wxGridCellCoords& );
       // int GoPathfinding(int F[7][7]);


        //(*Identifiers(tesgridFrame)
        static const long ID_GRID1;
        static const long ID_RADIOBUTTON1;
        static const long ID_RADIOBUTTON2;
        static const long ID_STATICTEXT11;
        static const long ID_STATICTEXT12;
        static const long ID_GAUGE1;
        static const long ID_STATICTEXT13;
        static const long ID_BUTTON4;
        static const long ID_BUTTON5;
        static const long ID_STATICTEXT1;
        static const long ID_TEXTCTRL1;
        static const long ID_STATICTEXT2;
        static const long ID_TEXTCTRL2;
        static const long ID_BUTTON1;
        static const long ID_BUTTON3;
        static const long ID_STATICTEXT3;
        static const long ID_STATICTEXT4;
        static const long ID_STATICTEXT5;
        static const long ID_STATICTEXT6;
        static const long ID_STATICTEXT7;
        static const long ID_STATICTEXT8;
        static const long ID_STATICTEXT9;
        static const long ID_STATICTEXT10;
        static const long ID_CHOICE1;
        static const long ID_BUTTON2;
        static const long ID_PANEL1;
        static const long idMenuQuit;
        static const long idMenuAbout;
        static const long ID_STATUSBAR1;
        //*)

        //(*Declarations(tesgridFrame)
        wxStaticText* StaticText10;
        wxStaticText* StaticText9;
        wxRadioButton* RadioButton1;
        wxButton* Button4;
        wxStaticText* StaticText13;
        wxStaticText* StaticText2;
        wxRadioButton* RadioButton2;
        wxButton* Button1;
        wxStaticText* StaticText6;
        wxGauge* Gauge1;
        wxStaticText* StaticText8;
        wxStaticText* StaticText11;
        wxPanel* Panel1;
        wxStaticText* StaticText1;
        wxStaticText* StaticText3;
        wxGrid* Grid1;
        wxButton* Button2;
        wxButton* Button5;
        wxButton* Button3;
        wxStaticText* StaticText5;
        wxStaticText* StaticText7;
        wxStatusBar* StatusBar1;
        wxTextCtrl* TextCtrl2;
        wxTextCtrl* TextCtrl1;
        wxStaticText* StaticText12;
        wxStaticText* StaticText4;
        wxChoice* Choice1;
        //*)
        wxGridCellCoords* CelCor;
//        ai *oba;
        DECLARE_EVENT_TABLE()
};


   class MyGridCellRenderer : public wxGridCellStringRenderer
        {
            public:
            virtual void Draw(wxGrid& grid,
                      wxGridCellAttr& attr,
                      wxDC& dc,
                      const wxRect& rect,
                      int row, int col,
                      bool isSelected);
        };

#endif // TESGRIDMAIN_H
