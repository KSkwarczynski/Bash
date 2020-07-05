using namespace std;

void SelmuPlot(TString fname, TString fname2, TString path, TString Outputname , int thresholdCut) //TODO dodaj sceizke koncową oraz rozbuduj mode
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
        FontSizeTitle = 0.040;
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
    gStyle->SetStatBorderSize(0);

    gStyle->SetStatX(0.89);
    gStyle->SetStatY(0.89);
    
    gStyle->SetPadColor(0);
    gStyle->SetCanvasColor(0);
    gStyle->SetStatColor(0);
    gStyle->SetFillColor(0);

    gStyle->SetEndErrorSize(4);
    gStyle->SetStripDecimals(kFALSE);

    gStyle->SetLegendBorderSize(0); //This option dsables legends borders
    gStyle->SetLegendFont(FontStyle);

    // set the paper & margin sizes
    gStyle->SetPaperSize(20, 26);
    gStyle->SetPadTopMargin(0.1);
    gStyle->SetPadBottomMargin(0.15);
    gStyle->SetPadRightMargin(0.075); // 0.075 -> 0.13 for colz option
    gStyle->SetPadLeftMargin(0.13);//to include both large/small font options

    // Fonts, sizes, offsets
    gStyle->SetTextFont(FontStyle);
    gStyle->SetTextSize(FontSizeTitle);

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
    gStyle->SetTitleSize(FontSizeTitle, "t");
    gStyle->SetTitleOffset(1.3, "x");
    gStyle->SetTitleOffset(1.3, "y");
    gStyle->SetTitleOffset(1.2, "z");

    gStyle->SetTitleStyle(0);
    gStyle->SetTitleFontSize(0.045);//0.08
    gStyle->SetTitleFont(FontStyle, "pad");
    gStyle->SetTitleX(0.6);
    gStyle->SetTitleY(0.96);
    //gStyle->SetTitleW(0.8f);

    // use bold lines and markers
    gStyle->SetMarkerStyle(20); //FIXME Coment this for FGD2
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
    
    //WARNING
    TString Directory="/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun4/scripts/";
    
    //TFile *file=TFile::Open("Run4_6M_Data.root");
    TFile *file=TFile::Open( Form("%s/AfterSelections/%s",path.Data(), fname.Data() ) );
    TTree *tree;
    file->GetObject("default",tree);

    int SavedVericesCounter=0;

    Int_t accum_level[1][3];   //[NTOYS]
    Int_t nfgdonlytracks;
    Float_t selmu_costheta[1];
    
    TBranch *b_accum_level;
    TBranch *b_nfgdonlytracks;
    TBranch *b_selmu_costheta;
    
    tree->SetBranchAddress("accum_level", accum_level, &b_accum_level);
    tree->SetBranchAddress("nfgdonlytracks", &nfgdonlytracks, &b_nfgdonlytracks);
    tree->SetBranchAddress("selmu_costheta", selmu_costheta, &b_selmu_costheta);
                
    int AllEvents=tree->GetEntries();
    

    TH1F *hCosTheta= new TH1F("hCosTheta", "hCosTheta", 10, -1 , 1);
    hCosTheta->GetXaxis()->SetTitle( "Cos(#theta)" );
    hCosTheta->SetLineColor(kRed);
    
    for(int i=0;  i<AllEvents; i++)
    {
        tree->GetEntry(i);
        //if(VERBOSE) cout<<" run "<<run<<" subrun "<<subrun<<" evt "<<evt<<" accum "<<accum_level[0][0]<<" nfgdonlytracks "<<nfgdonlytracks<<endl;

        if(accum_level[0][0]>7 && nfgdonlytracks==0)
        {
            hCosTheta->Fill(selmu_costheta[0]);
            SavedVericesCounter++;
        }
        if(SavedVericesCounter>=thresholdCut) break;
    }
 ////////////////////////////////////   
    
    TFile *file2=TFile::Open( Form("%s/AfterSelections/%s",path.Data(), fname2.Data() ) );
    TTree *tree2;
    file2->GetObject("default",tree2);

    int SavedVericesCounter2=0;

    Int_t accum_level2[1][3];   //[NTOYS]
    Int_t nfgdonlytracks2;
    Float_t selmu_costheta2[1];
    
    TBranch *b_accum_level2;
    TBranch *b_nfgdonlytracks2;
    TBranch *b_selmu_costheta2;
    
    tree2->SetBranchAddress("accum_level", accum_level2, &b_accum_level2);
    tree2->SetBranchAddress("nfgdonlytracks", &nfgdonlytracks2, &b_nfgdonlytracks2);
    tree2->SetBranchAddress("selmu_costheta", selmu_costheta2, &b_selmu_costheta2);
                
    int AllEvents2=tree2->GetEntries();
    TH1F *hCosTheta2= new TH1F("hCosTheta2", "hCosTheta2", 10, -1 , 1);
    hCosTheta2->SetLineColor(kBlue);
    for(int i=0;  i<AllEvents2; i++)
    {
        tree2->GetEntry(i);
        //if(VERBOSE) cout<<" run "<<run<<" subrun "<<subrun<<" evt "<<evt<<" accum "<<accum_level[0][0]<<" nfgdonlytracks "<<nfgdonlytracks<<endl;
        if(accum_level2[0][0]>7 && nfgdonlytracks2==0)
        {
            hCosTheta2->Fill(selmu_costheta2[0]);
            SavedVericesCounter2++;
        }
        if(SavedVericesCounter2>=thresholdCut) break;
    }
    
    
    
    

    
    /////////////////////// 
    
    cout<<" histo 1 "<<hCosTheta->GetEntries()<<" histo 2 "<<hCosTheta2->GetEntries()<<endl;
    TCanvas *Canvas = new TCanvas("Canvas","Canvas",0, 0, 800,630);
    hCosTheta->SetLineColor(kRed);
    hCosTheta2->SetLineColor(kBlue);
    hCosTheta->SetLineStyle(2);
    hCosTheta2->SetLineStyle(7);
    
    int maximum1=hCosTheta->GetMaximum();;
    int maximum2=hCosTheta2->GetMaximum();
    if(maximum2>maximum1)
    {
        hCosTheta->SetMaximum(maximum2+100);
    }       
    hCosTheta->Draw("");
    hCosTheta2->Draw("SAME");
    
    TLegend *legend = new TLegend(0.20,0.50,0.4,0.75);
    legend->AddEntry(hCosTheta,"Data","l");
    legend->AddEntry(hCosTheta2, "MC","l");
    legend->SetFillColor(0);
    legend->SetTextSize(0.035);
    legend->Draw();
    
    //Run4MCprod6T-FGD1-nu-selmuCosTheta
    gPad->Modified();
    Canvas->Print( Form("%s/scripts/plots/%s.pdf",path.Data(), Outputname.Data() ) );
    delete Canvas;
}
