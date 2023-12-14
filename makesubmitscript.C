void makesubmitscript()
{

vector<int> vruns;
vector<int> vsegs;
ifstream ifs;
//string stmp1;
int runno;
int nseg;
//int itmp1;
int count1=0;
char buffer[6];
ifs.open("uniqueruns.txt");
if ( ifs.fail() ) { cout << "FAIL TO READ INPUT FILE 1" << endl; ifs.close(); return; }
while(!ifs.eof()) {
  ifs >> runno >> nseg;
  count1++;
  vruns.push_back(runno);
  vsegs.push_back(nseg);
  cout << runno << " " << nseg << endl;
}
ifs.close();
cout << "read " << count1 << " " << vruns.size() << " " << vsegs.size() << " lines from input." << endl;

ofstream ofs;
ofs.open("submitall.csh");
for(int i=0; i<vruns.size(); i++){
  ofs << "condor_submit RunNumber="<<vruns[i]<<" Nqueue="<<vsegs[i]<<" condor.job" << endl;
}

}

