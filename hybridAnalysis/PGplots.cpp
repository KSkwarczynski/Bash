using namespace std;

void PGplots()
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
    
    bool DEBUGMODE=false;
    bool VERBOSE=false;
        
    //TFile *file=TFile::Open( "PionPG.root" );
    TFile *file=TFile::Open( "ProtonPG.root" );
    TTree *tree;
    file->GetObject("EventInfo",tree);

    Int_t           NTraj;
    Int_t           NTracks;
    Int_t           GoodEvent;
    //Float_t         Pdg[24][fNTraj];   //[fNTraj]
    Float_t         X;
    Float_t         Y;
    Float_t         Z;
    Float_t         T;
    Float_t         Px;
    Float_t         Py;
    Float_t         Pz;
    Float_t         P;
    Float_t         E;
    Float_t         Theta;
    Float_t         Phi;

    // List of branches
    TBranch        *b_fNTraj;   //!
    TBranch        *b_fNTracks;   //!
    TBranch        *b_fGoodEvent;   //!
    //TBranch        *b_Pdg;   //!
    TBranch        *b_fX;   //!
    TBranch        *b_fY;   //!
    TBranch        *b_fZ;   //!
    TBranch        *b_fT;   //!
    TBranch        *b_fPx;   //!
    TBranch        *b_fPy;   //!
    TBranch        *b_fPz;   //!
    TBranch        *b_fP;   //!
    TBranch        *b_fE;   //!
    TBranch        *b_fTheta;   //!
    TBranch        *b_fPhi;   //!
        
    tree->SetBranchAddress("NTraj", &NTraj, &b_fNTraj);
    tree->SetBranchAddress("NTracks", &NTracks, &b_fNTracks);
    tree->SetBranchAddress("GoodEvent", &GoodEvent, &b_fGoodEvent);
    //tree->SetBranchAddress("Pdg[fNTraj]", Pdg, &b_Pdg);
    tree->SetBranchAddress("X", &X, &b_fX);
    tree->SetBranchAddress("Y", &Y, &b_fY);
    tree->SetBranchAddress("Z", &Z, &b_fZ);
    tree->SetBranchAddress("T", &T, &b_fT);
    tree->SetBranchAddress("Px", &Px, &b_fPx);
    tree->SetBranchAddress("Py", &Py, &b_fPy);
    tree->SetBranchAddress("Pz", &Pz, &b_fPz);
    tree->SetBranchAddress("P", &P, &b_fP);
    tree->SetBranchAddress("E", &E, &b_fE);
    tree->SetBranchAddress("Theta", &Theta, &b_fTheta);
    tree->SetBranchAddress("Phi", &Phi, &b_fPhi);
        
                
    int AllEvents=tree->GetEntries();
    if(VERBOSE) cout<< "\033[1;34mNumber of all events\033[0m" <<AllEvents<<endl;
    
    //TH1F *hEnergy= new TH1F("hEnergy", "hEnergy", 8, 160 , 350);
    TH1F *hEnergy= new TH1F("hEnergy", "hEnergy", 8, 1000 , 1400);
    hEnergy->GetXaxis()->SetTitle( "E [MeV]" );

    TH1F *hCosTheta= new TH1F("hCosTheta", "hCosTheta", 8, -1.1 , 1.1);
    hCosTheta->GetXaxis()->SetTitle( "Cos(#theta)" );
    
    for(int i=0;  i<AllEvents; i++) //Neccesary for MC normalization
    {
        tree->GetEntry(i);
        hEnergy->Fill(E);
        hCosTheta->Fill( cos(Theta) );
    }
    TCanvas *Canvas = new TCanvas("Canvas","Canvas",0, 0, 800,630);
    hEnergy->Draw("");
    gPad->Modified();
    Canvas->Print( "/Users/kolos/Desktop/temp/PGenergy.pdf" ); //WARNING 
    delete Canvas;
    
    TCanvas *Canvas = new TCanvas("Canvas","Canvas",0, 0, 800,630);
    hCosTheta->Draw("");
    gPad->Modified();
    Canvas->Print( "/Users/kolos/Desktop/temp/PGcosTheta.pdf" ); //WARNING 
    delete Canvas;
}
