using namespace std;

void ListCreator(TString Vertexinput, TString RecoInput, TString OutputFile, bool ISMC)
{
    TString Directory="/mnt/home/share/t2k/kskwarczynski/hybrid_analysis/hybridRun7/scripts/";
    bool VERBOSE=false;
    
    long double NlineVertex = 0;
    string lineVertex;
    ifstream vertexFile(Vertexinput.Data());

    if (vertexFile.is_open())
    {
        while(!vertexFile.eof())
        {
            getline(vertexFile,lineVertex);
            NlineVertex++;
        }
    }
    vertexFile.close();
    
    vertexFile.open(Vertexinput.Data());
    
    long double NlinesReco = 0;
    string lineReco;
    ifstream recoFile(RecoInput.Data());

    if (recoFile.is_open())
    {
        while(!recoFile.eof())
        {
            getline(recoFile,lineReco);
            NlinesReco++;
        }
    }
    recoFile.close();
    
    recoFile.open(RecoInput.Data());
    
    fstream OutputRunFile;
    OutputRunFile.open( OutputFile.Data(), ios::out);
        
    const int NLINES=NlineVertex;
    if(VERBOSE) cout<<NLINES<<endl;
    
    int run[NLINES];
    int subrun[NLINES];
    int evt[NLINES];
    std::vector<string> SearchedFileName;
    std::vector<string> FilesToSave;
    TString LiczbaZer="0";
    string RecoName;
    TString starRecoName="oa_nd_spl_000";
    if(ISMC) starRecoName="oa_nt_beam_";
    if (vertexFile.is_open())
    {
        for(int i=0; i<NLINES ; i++)
        {
            vertexFile >> run[i] >> subrun[i] >> evt[i];
            if(VERBOSE) cout<<run[i] <<"  "<< subrun[i]<<" "<<evt[i]<<endl;
            if(subrun[i]<10) LiczbaZer="000";
            if(subrun[i]>=10) LiczbaZer="00";
            if(subrun[i]>=100) LiczbaZer="0";
            if(i>0)
            {
                if(run[i]==run[i-1] && subrun[i]==subrun[i-1]) 
                {
                    if(VERBOSE) cout<<"Skiping"<<endl;
                    continue;
                }
            }
            SearchedFileName.push_back(Form("%s%i-%s%i", starRecoName.Data(), run[i], LiczbaZer.Data(), subrun[i]));
            if(VERBOSE) cout<<SearchedFileName.back()<<endl;
        
        }
    }
    
    if (vertexFile.is_open())
    {
        for(int i=0; i<NlinesReco ; i++)
        {
            recoFile >> RecoName;
            for(int ik=0; ik<SearchedFileName.size() ; ik++)
            {
                if (RecoName.find( SearchedFileName.at(ik) ) != string::npos)
                {
                    if(VERBOSE)cout<<"TEST "<<RecoName<<endl;
                    OutputRunFile<<RecoName<<endl;
                }
            }
        }
    }

    vertexFile.close();
    recoFile.close();
    OutputRunFile.close();
}
