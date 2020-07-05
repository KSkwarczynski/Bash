#!/usr/bin/python/
import sys
import os
import string
import re
from operator import itemgetter

def main():
  filelist = os.listdir("./nd280_hitskim") #list current directory
  #WARNING setting proton or pion
  filelist = [file for file in filelist if "proton" in file and "hits" in file]
  goodfiles=[]
  goodlengths=[]
  for file in filelist:
    f = open('./nd280_hitskim/%s'%file,'r')
    hits = f.readlines()
    eventlist=[]
    for hit in hits:
      hit=hit.split()
      run = hit[0]
      srun = hit[1]
      event = hit[2]
      eventlist.append(event)
    eventset=set(eventlist)
    goodfiles.append(file)
    goodlengths.append(len(eventset))
#zakomentowalam else bo w poprzednim skrypcie puscilam skimHitInfo_v2 z odrzucamiem zmatchowanych torow FGD-TPC i dlugosc zawsze byla mniejsza niz 100
    #if len(eventset) == 100: 
      #goodfiles.append(file)
    #else:			
      #print "bad job found"
      #print file, len(eventset)

    f.close()
  
  masterHitList =[]
  jobs =[]


  vertexHitDict = dict()
  for file in goodfiles:
    #print 'opening file %s\n'%file
    f = open('./nd280_hitskim/%s'%file,'r')
    match = re.search(r'r(\d+)s(\d+)e(\d+)','./nd280_hitskim/%s'%file)
    run = match.group(1)
    srun = match.group(2)
    event = match.group(3)
    hits = f.readlines()
    vertexHitDict[match.group()]=list()
    for hit in hits:
      hit=hit.split()
      hit.append(run)
      hit.append(srun)
      hit.append(event)
      #masterHitList.append(hit)
      #jobs.add(event)
      #jobs.append(hit[2])
      vertexHitDict[match.group()].append(hit)

  #jobs = set(jobs)
  #masterHitDict = dict()
  #for job in jobs:
  #  masterHitDict[job]=list()

  #print 'Creating dictionary of hits\n'
  #for hit in masterHitList:
  #  masterHitDict[hit[2]].append(hit)
  #print 'Dictionary of hits created\n'
  
  

  #create a file of truth info for this job file
  #filelist = os.listdir("./nd280_hitskim") #list current directory
  #filelist = [file for file in filelist if "proton" in file and "truth" in file]
  truthdata=[]
  vertexTruthDict = dict()
  vertexList=[]
  for file in goodfiles:
    truthfile = file[0:-8]+'truth.txt'
    f = open('./nd280_hitskim/%s'%truthfile, 'r')
    match = re.search(r'r(\d+)s(\d+)e(\d+)','./nd280_hitskim/%s'%file)
    run = match.group(1)
    srun = match.group(2)
    event = match.group(3)
    lines = f.readlines()
    vertexTruthDict[match.group()]=list()
    vertexList.append(match.group())
    for line in lines:
      line=line.split()
      line.append(run)
      line.append(srun)
      line.append(event)
      truthdata.append(line)
      vertexTruthDict[match.group()].append(line)
    f.close()

  for item in vertexList:
    print item

  for item in vertexList[0:1]:
    print item
    print vertexTruthDict[item][0:3], len(vertexTruthDict[item])
    print vertexHitDict[item][0:5], len(vertexHitDict[item])

  
  

  #print jobs
  jobcount = 0
  jobtotal = len(vertexList)
  #for job in range(100):
  for job in range(100):
    f = open ('./job%s-hits.txt'%job,'w')
    ftruth = open ('./job%s-truth.txt'%job,'w')
    print 'Processing job %s (%d/%d)'%(job,jobcount,jobtotal)
    #print 'Dictionary entry for job %s hits has %s entries\n'%(job,len(vertexHitDict[vertexList[vertex]]))
    #print 'dictionary entry for job %s truth has %s entries\n'%(job,len(vertexTruthDict[vertexList[vertex]]))
    for vertex in range(len(vertexList)):

      print job, vertex, vertexList[vertex]
      if len(vertexTruthDict[vertexList[vertex]]) == 0:
      	continue
      truthjob = vertexTruthDict[vertexList[vertex]][0][2]
      #print truthjob
      hitlisttoremove=list()
      for hit in vertexHitDict[vertexList[vertex]]:
        #print hit[2]
        if hit[2] == truthjob:
        	if truthjob[-len(str(job)):] == str(job):
        		#jobrun, jobsubrun, jobevent, gId, Q, T, vtxRun, vtxSubrun, vtxEvent
        		f.write('%s %s %s %s %s %s %s %s %s\n'%(hit[0],hit[1],hit[2],hit[3],hit[4],hit[5],hit[6],hit[7],hit[8]))
        		hitlisttoremove.append(hit)

      for hit in hitlisttoremove:
        vertexHitDict[vertexList[vertex]].remove(hit)

        
          #for truth in truthdata:

      for truth in vertexTruthDict[vertexList[vertex]]:
        #print truth[2]
        if truth[2] == truthjob:
        	if truthjob[-len(str(job)):] == str(job):
		        #this is a hack line to avoid the retarded output writing as above
		        #joins a space ' ' with each element in the list, writes it as a string.
        		ftruth.write(' '.join(truth))
        		ftruth.write('\n')
        		vertexTruthDict[vertexList[vertex]].remove(truth)
    jobcount = jobcount+1 
    f.close()
    ftruth.close()

  os.system('mkdir nd280_jobs')
  os.system('mv job*.txt nd280_jobs')


if __name__ == '__main__':
	main()

