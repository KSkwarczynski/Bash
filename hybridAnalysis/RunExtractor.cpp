using namespace std;

void RunExtractor(TString fname, TString txtName, int mode) //TODO dodaj sceizke koncową oraz rozbuduj mode
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
    
    TString Directory="/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/scripts/";
    
    //TFile *file=TFile::Open("Run4_6M_Data.root");
    TFile *file=TFile::Open( Form("/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/AfterSelections/%s", fname.Data() ) );
    TTree *tree;
    file->GetObject("default",tree);
    //WARNING HAVE TO SET POT NUMBER MANUALLY USING HIGHLAND draw.DumpPOT !!!
    //Variables neccesary for normalization
    //double DataPOT=2.83453*pow(10, 20);
    //double McPOT=3.10204*pow(10, 21);
    int SavedVericesCounter=0;
    //int SavedVericesNOMINAL=0; //this is only used for MC
    
    Int_t run;
    Int_t subrun;
    Int_t evt;
    Int_t accum_level[1][3];   //[NTOYS]
    Int_t cut7[1][3];//[NTOYS]
    Int_t nfgdtracks;
    Int_t nfgdonlytracks;
    Float_t selmu_pos[4];
    Float_t selvtx_pos[4];
    Float_t selmu_dir[3];
    Float_t selmu_costheta[1];
    
    TBranch *b_run;
    TBranch *b_subrun;
    TBranch *b_evt;
    TBranch *b_accum_level;
    TBranch *b_cut7;
    TBranch *b_nfgdtracks;
    TBranch *b_nfgdonlytracks;
    TBranch *b_selmu_pos;
    TBranch *b_selvtx_pos;
    TBranch *b_selmu_dir;
    TBranch *b_selmu_costheta;
    
    tree->SetBranchAddress("run", &run, &b_run);
    tree->SetBranchAddress("subrun", &subrun, &b_subrun);
    tree->SetBranchAddress("evt", &evt, &b_evt);
    tree->SetBranchAddress("accum_level", accum_level, &b_accum_level);
    tree->SetBranchAddress("cut7", cut7, &b_cut7);
    tree->SetBranchAddress("nfgdtracks", &nfgdtracks, &b_nfgdtracks);
    tree->SetBranchAddress("nfgdonlytracks", &nfgdonlytracks, &b_nfgdonlytracks);
    tree->SetBranchAddress("selmu_pos", selmu_pos, &b_selmu_pos);
    tree->SetBranchAddress("selvtx_pos", selvtx_pos, &b_selvtx_pos);
    tree->SetBranchAddress("selmu_dir", selmu_dir, &b_selmu_dir);
    tree->SetBranchAddress("selmu_costheta", selmu_costheta, &b_selmu_costheta);
    
    fstream FileVertexOut;
    FileVertexOut.open( Form("%s%s", Directory.Data(), txtName.Data()), ios::out);
                
    int AllEvents=tree->GetEntries();
    if(VERBOSE) cout<< "\033[1;34mNumber of all events\033[0m" <<AllEvents<<endl;
    
    if(DEBUGMODE) AllEvents=100;
    /*
    for(int i=0;  i<AllEvents; i++) //Neccesary for MC normalization
    {
        tree->GetEntry(i);
        if(accum_level[0][0]>7)
        {
            SavedVericesNOMINAL++;
        }
    }
    */
    
    TH1F *hCosTheta= new TH1F("hCosTheta", "hCosTheta", 10, -1 , 1);
    hCosTheta->GetXaxis()->SetTitle( "Cos(#theta)" );
    
    
    for(int i=0;  i<AllEvents; i++)
    {
        tree->GetEntry(i);
        if(VERBOSE) cout<<" run "<<run<<" subrun "<<subrun<<" evt "<<evt<<" accum "<<accum_level[0][0]<<" nfgdonlytracks "<<nfgdonlytracks<<endl;

        if(accum_level[0][0]>7 && nfgdonlytracks==0)
        {
            if(mode==0) FileVertexOut<<run<<","<<subrun<<","<<evt<<endl;
            if(mode==1) FileVertexOut<<run<<" "<<subrun<<" "<<evt<<endl;
            if(mode==2) FileVertexOut<<run<<" "<<subrun<<" "<<evt<<" "<<selvtx_pos[0]<<" "<<selvtx_pos[1]<<" "<<selvtx_pos[2]<<" "<<selvtx_pos[3]<<endl;
            if(mode==3) FileVertexOut<<run<<" "<<subrun<<" "<<evt<<" "<<selmu_dir[0]<<" "<<selmu_dir[1]<<" "<<selmu_dir[2]<<endl;
            hCosTheta->Fill(selmu_costheta[0]);
            
            SavedVericesCounter++;
        }
        if(SavedVericesCounter>=1000) break;
    }
    
    if(mode==0)
    {
        TCanvas *Canvas = new TCanvas("Canvas","Canvas",0, 0, 800,630);
        hCosTheta->Draw("");
        gPad->Modified();
        Canvas->Print( Form("%s/plots/%sselmuCosTheta.pdf",Directory.Data(), fname.Data() ) );
        delete Canvas;
    }
}
