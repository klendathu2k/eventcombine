void makerunlist()
{

vector<int> vruns;
ifstream ifs;
string stmp1;
int itmp1;
int count1=0;
char buffer[6];
ifs.open("prdflist.txt");
if ( ifs.fail() ) { cout << "FAIL TO READ INPUT FILE 1" << endl; ifs.close(); return; }
while(!ifs.eof()) {
  ifs >> stmp1;
  std::size_t length = stmp1.copy(buffer,5,62); buffer[length]='\0';
  int itmp1 = atoi(buffer);
  count1++;
  vruns.push_back(itmp1);
  //cout << itmp1 << endl;
}
ifs.close();
cout << "read " << count1 << " " << vruns.size() << " lines from input." << endl;

int tmprun = 99999;
int tmpcount = 1;
vector<int> uniqueruns;
vector<int> nsegments;
for(int i=0; i<vruns.size(); i++) {
  if(vruns[i]!=tmprun) {
    uniqueruns.push_back(vruns[i]);
    if(tmprun!=99999) {
      nsegments.push_back(tmpcount);
      tmpcount = 1;
    }
    tmprun = vruns[i];
  }
  else {
    tmpcount++;
  }
}
nsegments.push_back(tmpcount-1);

cout << "unique runs: " << uniqueruns.size() << endl;
for(int i=0; i<uniqueruns.size(); i++){
//  cout << uniqueruns[i] << " " << nsegments[i] << endl;
  cout << uniqueruns[i] << endl;
}

ofstream ofs;
ofs.open("uniqueruns.txt");
for(int i=0; i<uniqueruns.size(); i++){
//  ofs << uniqueruns[i] << " " << nsegments[i] << endl;
  ofs << uniqueruns[i] << endl;
}




}
 
