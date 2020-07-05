#!/usr/bin/python/
import sys
import os
import string

from multiprocessing import Process, Array, Queue, Lock


class glbls:
  nthreads=1		#number of threads to run at a time
  thrdlist = [] 	#list of threads
  runlist = os.listdir("./nd280_reco") #list current directory
  ext = ".root" #ending of filtered files
  #WARNING
  runlist=[int(filename.split("e")[-1].split(".")[0]) for filename in runlist if ext in filename and "proton" in filename] #get numc files and run numbers
  #particlenames=['oa_pg_pip','oa_pg_proton']
  #WARNING
  particlenames=['oa_pg_proton']

def runFilterThread(id, wrkQ):
  nq = 0 	#count number of runs this thread gets through
  while 1:
    try: 
    	#get next item in work queue
    	#True means wait for an item to be available
    	#2nd argument tells how long to wait for an item to become available
    	#for some reason, if you don't wait the queue appears empty
    	irun=wrkQ.get(True,1) 
    except: 
    	break #no items? get out of here
    nq += 1
    workingdir = os.getcwd()
    print "Running "+str(irun)
    inputfiles = os.listdir("./nd280_reco")
    for p in glbls.particlenames:
      inputfile = [filename for filename in inputfiles if p in filename and str(irun) in filename][0]
      ifile=workingdir+"/nd280_reco/"+inputfile
#      os.system('skimHitInfo.exe %s -o %s.dummy'%(ifile,inputfile[0:-5]))
       #WARNING
      os.system('/mnt/home/kskwarczynski/T2K/work/v11r31/highland2/hybrid/v0r0/Linux-x86_64/skimHitInfo_v3.exe %s -o %s.dummy'%(ifile,inputfile[0:-5]))
      os.system('mv %s-hits.txt nd280_hitskim/'%inputfile[0:-5]) 
      os.system('mv %s-truth.txt nd280_hitskim/'%inputfile[0:-5])
      os.system('rm %s.dummy'%inputfile[0:-5])
		


def main():
  #build the work list that threads will pick from
  wrkQ = Queue() 
  os.system('mkdir nd280_hitskim')
  print glbls.runlist
  for irun in glbls.runlist: 
  	wrkQ.put(irun)

  for i in range(glbls.nthreads):
  	pf = Process(target=runFilterThread, args=(i,wrkQ))
  	glbls.thrdlist.append(pf)
  	#pfs.append(pf)
  	pf.start()
  
  for thrd in glbls.thrdlist: thrd.join()
  

if __name__ == '__main__':
	main()

