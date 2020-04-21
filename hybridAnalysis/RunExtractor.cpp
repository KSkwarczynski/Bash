using namespace std;

void RunExtractor(TString fname, TString txtName, int mode) //TODO dodaj sceizke koncową oraz rozbuduj mode
{
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
            SavedVericesCounter++;
        }
        if(SavedVericesCounter>=1000) break;
    }
}
