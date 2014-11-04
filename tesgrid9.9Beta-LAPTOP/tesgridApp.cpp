/***************************************************************
 * Name:      tesgridApp.cpp
 * Purpose:   Code for Application Class
 * Author:     ()
 * Created:   2012-07-05
 * Copyright:  ()
 * License:
 **************************************************************/

#include "wx_pch.h"
#include "tesgridApp.h"

//(*AppHeaders
#include "tesgridMain.h"
#include <wx/image.h>
//*)

IMPLEMENT_APP(tesgridApp);

bool tesgridApp::OnInit()
{
    //(*AppInitialize
    bool wxsOK = true;
    wxInitAllImageHandlers();
    if ( wxsOK )
    {
    	tesgridFrame* Frame = new tesgridFrame(0);
    	Frame->Show();
    	SetTopWindow(Frame);
    }
    //*)
    return wxsOK;

}
