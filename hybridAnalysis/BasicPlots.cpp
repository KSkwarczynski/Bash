using namespace std;

void BasicPlots(TString fname, TString Directory, TString OutString)
//void BasicPlots()
{
    // -- WhichStyle --
    // 1 = presentation large fonts
    // 2 = presentation small fonts
    // 3 = publication/paper
    Int_t WhichStyle = 3;
    
    Int_t FontStyle = 22;
    Float_t FontSizeLabel = 0.035;
    Float_t FontSizeTitle = 0.05;
    Float_t YOffsetTitle = 1.3;

  switch(WhichStyle) 
  {
    case 1:
        FontStyle = 42;
        FontSizeLabel = 0.05;
        FontSizeTitle = 0.065;
        YOffsetTitle = 1.19;
        break;
    case 2:
        FontStyle = 42;
        FontSizeLabel = 0.035;
        FontSizeTitle = 0.05;
        YOffsetTitle = 1.6;
        break;
    case 3:
        FontStyle = 132;
        FontSizeLabel = 0.035;
        FontSizeTitle = 0.05;
        YOffsetTitle = 1.6;
        break;
    }
    // use plain black on white colors
    gStyle->SetFrameBorderMode(0);
    gStyle->SetCanvasBorderMode(0);
    gStyle->SetPadBorderMode(0);
    gStyle->SetCanvasBorderSize(0);
    gStyle->SetFrameBorderSize(0);
    gStyle->SetDrawBorder(0);
    gStyle->SetTitleBorderSize(0);

    gStyle->SetPadColor(0);
    gStyle->SetCanvasColor(0);
    gStyle->SetStatColor(0);
    gStyle->SetFillColor(0);

    gStyle->SetEndErrorSize(4);
    gStyle->SetStripDecimals(kFALSE);

    //gStyle->SetLegendBorderSize(0); //This option dsables legends borders
    gStyle->SetLegendFont(FontStyle);

    // set the paper & margin sizes
    gStyle->SetPaperSize(20, 26);
    gStyle->SetPadTopMargin(0.1);
    gStyle->SetPadBottomMargin(0.15);
    gStyle->SetPadRightMargin(0.13); // 0.075 -> 0.13 for colz option
    gStyle->SetPadLeftMargin(0.16);//to include both large/small font options

    // Fonts, sizes, offsets
    gStyle->SetTextFont(FontStyle);
    gStyle->SetTextSize(0.08);

    gStyle->SetLabelFont(FontStyle, "x");
    gStyle->SetLabelFont(FontStyle, "y");
    gStyle->SetLabelFont(FontStyle, "z");
    gStyle->SetLabelFont(FontStyle, "t");
    gStyle->SetLabelSize(FontSizeLabel, "x");
    gStyle->SetLabelSize(FontSizeLabel, "y");
    gStyle->SetLabelSize(FontSizeLabel, "z");
    gStyle->SetLabelOffset(0.015, "x");
    gStyle->SetLabelOffset(0.015, "y");
    gStyle->SetLabelOffset(0.015, "z");

    gStyle->SetTitleFont(FontStyle, "x");
    gStyle->SetTitleFont(FontStyle, "y");
    gStyle->SetTitleFont(FontStyle, "z");
    gStyle->SetTitleFont(FontStyle, "t");
    gStyle->SetTitleSize(FontSizeTitle, "y");
    gStyle->SetTitleSize(FontSizeTitle, "x");
    gStyle->SetTitleSize(FontSizeTitle, "z");
    gStyle->SetTitleOffset(1.14, "x");
    gStyle->SetTitleOffset(YOffsetTitle, "y");
    gStyle->SetTitleOffset(1.2, "z");

    gStyle->SetTitleStyle(0);
    gStyle->SetTitleFontSize(0.06);//0.08
    gStyle->SetTitleFont(FontStyle, "pad");
    gStyle->SetTitleBorderSize(0);
    gStyle->SetTitleX(0.1f);
    gStyle->SetTitleW(0.8f);

    // use bold lines and markers
    gStyle->SetMarkerStyle(20);
    gStyle->SetHistLineWidth( Width_t(2.5) );
    gStyle->SetLineStyleString(2, "[12 12]"); // postscript dashes

    // get rid of X error bars and y error bar caps
    gStyle->SetErrorX(0.001);

    // do not display any of the standard histogram decorations
    gStyle->SetOptTitle(0); //Set 0 to disable histogram tittle
    gStyle->SetOptStat(0); //Set 0 to disable statystic box
    gStyle->SetOptFit(0);

    // put tick marks on top and RHS of plots
    gStyle->SetPadTickX(0);
    gStyle->SetPadTickY(0);

    // -- color --
    // functions blue
    //gStyle->SetFuncColor(600-4);
    gStyle->SetFuncColor(2);
    gStyle->SetFuncWidth(2);

    gStyle->SetFillColor(1); // make color fillings (not white)
    // - color setup for 2D -
    // - "cold"/ blue-ish -
    Double_t red[]   = { 0.00, 0.00, 0.00 };
    Double_t green[] = { 1.00, 0.00, 0.00 };
    Double_t blue[]  = { 1.00, 1.00, 0.25 };
    // - "warm" red-ish colors -
    //  Double_t red[]   = {1.00, 1.00, 0.25 };
    //  Double_t green[] = {1.00, 0.00, 0.00 };
    //  Double_t blue[]  = {0.00, 0.00, 0.00 };

    Double_t stops[] = { 0.25, 0.75, 1.00 };
    const Int_t NRGBs = 3;
    const Int_t NCont = 500;

    TColor::CreateGradientColorTable(NRGBs, stops, red, green, blue, NCont);
    gStyle->SetNumberContours(NCont);

    // - Rainbow -
    gStyle->SetPalette(1);  // use the rainbow color set

    // -- axis --
    gStyle->SetStripDecimals(kFALSE); // don't do 1.0 -> 1
    //  TGaxis::SetMaxDigits(3); // doesn't have an effect
    // no supressed zeroes!
    gStyle->SetHistMinimumZero(kTRUE);    
/////////////////////////////////////////////////////////////////////  
/////////////////////////////////////////////////////////////////////     
/////////////////////////////////////////////////////////////////////  
    
    
    //TString fname= "vertexSkimRun7DATAprod6T-FGD1-antinu.txt";
    //TString Directory="/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/scripts";
    //TString OutString = "Run7DATAprod6T-FGD1-antinu";
   
    bool DEBUGMODE=false;
    bool VERBOSE=false;
    
    int NlineVertex = 0;
    string lineVertex;
    ifstream vertexFile( Form("%s/%s",Directory.Data(), fname.Data() ) );

    if (vertexFile.is_open())
    {
        while(!vertexFile.eof())
        {
            getline(vertexFile,lineVertex);
            NlineVertex++;
        }
    }
    else cout<<" FILE COULD NOT BE LOADED YOU MORON"<<endl;
    vertexFile.close();
    
    cout<<" NlineVertex " <<NlineVertex<<endl;
    vertexFile.open( Form("%s/%s",Directory.Data(), fname.Data() ) );
 
    int run;
    int subrun;
    int evt;
    
    double selvtx_pos[5];
    
    TH1F *hVertexPosX= new TH1F("hVertexPosX", "hVertexPosX", 10, -850 , 850);
    hVertexPosX->GetXaxis()->SetTitle( "vertex X position [mm]" );
    //hVertexPosX->SetMaximum(220);
    hVertexPosX->SetMinimum(0);
    
    TH1F *hVertexPosY= new TH1F("hVertexPosY", "hVertexPosY", 10, -850 , 850);
    hVertexPosY->GetXaxis()->SetTitle( "vertex Y position [mm]" );
    //hVertexPosY->SetMaximum(220);
    hVertexPosY->SetMinimum(0);
    
    TH1F *hVertexPosZ= new TH1F("hVertexPosZ", "hVertexPosZ", 10, 140 , 440);
    hVertexPosZ->GetXaxis()->SetTitle( "vertex Z position [mm]" );
    //hVertexPosZ->SetMaximum(220);
    hVertexPosZ->SetMinimum(0);
    
    if (vertexFile.is_open())
    {
        for(int i=0; i<1000 ; i++)
        {
            vertexFile >> run >> subrun >> evt >> selvtx_pos[0] >> selvtx_pos[1] >> selvtx_pos[2] >> selvtx_pos[3];
            hVertexPosX->Fill(selvtx_pos[0]);
            hVertexPosY->Fill(selvtx_pos[1]);
            hVertexPosZ->Fill(selvtx_pos[2]);
        }
    }
    
    TCanvas *Canvas = new TCanvas("Canvas","Canvas",0, 0, 800,630);
    hVertexPosX->Draw("pe");
    gPad->Modified();
    Canvas->Print( Form("%s/plots/%sVertexPosX.pdf", Directory.Data(), OutString.Data()) ); 
    delete Canvas;
    
    TCanvas *Canvas = new TCanvas("Canvas","Canvas",0, 0, 800,630);
    hVertexPosY->Draw("pe");
    gPad->Modified();
    Canvas->Print( Form("%s/plots/%sVertexPosY.pdf", Directory.Data(), OutString.Data()) ); 
    delete Canvas;
    
    TCanvas *Canvas = new TCanvas("Canvas","Canvas",0, 0, 800,630);
    hVertexPosZ->Draw("pe");
    gPad->Modified();
    Canvas->Print( Form("%s/plots/%sVertexPosZ.pdf", Directory.Data(), OutString.Data()) ); 
    delete Canvas;
    
    vertexFile.close();
}
