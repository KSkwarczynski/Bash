#!/usr/bin/python/
import sys
import os
import string

from multiprocessing import Process, Array, Queue, Lock


class glbls:
  nthreads=1		#number of threads to run at a time
  thrdlist = [] 	#list of threads
  #runlist = range(1000,1010)
  runlist = []
  events = []
  #particlenames = ['proton','piplus']
  #WARNING
  particlenames = ['piminus']


def getRun(event):
  for e in glbls.events:
    if e[2] == event:
      return e[0]

def getSubrun(event):
  for e in glbls.events:
    if e[2] == event:
      return e[1]

def getXYZ(event):
  for e in glbls.events:
    if e[2] == event:
      return float(e[3])/10.0,float(e[4])/10.0,float(e[5])/10.0

def runFilterThread(id, wrkQ):
  nq = 0 	#count number of runs this thread gets through
  while 1:
    try: 
      #get next item in work queue
      #True means wait for an item to be available
      #2nd argument tells how long to wait for an item to become available
      #for some reason, if you don't wait the queue appears empty
      event=wrkQ.get(True,1) 
    except: 
      break #no items? get out of here
    nq += 1
    print "Running "+str(event)
    event = str(event)
#    particle = glbls.particlename
    for particle in glbls.particlenames:
      run = getRun(event)
      subrun = getSubrun(event)
      x,y,z = getXYZ(event)
      tag = "r%ss%se%s"%(run, subrun, event)
      pNameConfig=''
      emin = ''
      emax = ''
      if particle == "piminus":
        pNameConfig = "pi-"
#        emin = "100"
#        emax = "200"
        emin = "31"
        emax = "195"
      if particle == "piplus":
        pNameConfig = "pi+"
#        emin = "100"
#        emax = "200"
        emin = "31"
        emax = "195"
      elif particle == "proton":
        pNameConfig = "proton"
#        emin = "800"
#        emax = "900"
        emin = "81"
        emax = "433"
      os.system('cp generate_particles.cfg \"%s_R%s_SR%s_E%s.cfg\"'%(particle, run, subrun, event))
      os.system('sed -i \"s/mc_particle = pdg/mc_particle = %s/g\" %s_R%s_SR%s_E%s.cfg'%(pNameConfig, particle, run, subrun, event))
      os.system('sed -i \"s/mc_energy = en/mc_energy = uniform %s %s/g\" %s_R%s_SR%s_E%s.cfg'%(emin,emax, particle, run, subrun, event))
      os.system('sed -i \"s/comment = tag/comment = r%ss%se%s/g\" %s_R%s_SR%s_E%s.cfg'%(run, subrun, event, particle, run, subrun, event))
      os.system('sed -i \"s/run_number = run_num/run_number = %s/g\" %s_R%s_SR%s_E%s.cfg'%(run, particle, run, subrun, event))
      os.system('sed -i \"s/subrun = subrun_num/subrun = %s/g\" %s_R%s_SR%s_E%s.cfg'%(subrun, particle, run, subrun, event))
      os.system('sed -i \"s/mc_position = vertex/mc_position = Point %.3f %.3f %.3f/g\" %s_R%s_SR%s_E%s.cfg'%(x, y, z, particle, run, subrun, event))
      os.system('RND=`echo \"scale=9;$RANDOM/32767*900000000\" | bc | cut -d\'.\' -f1`; sed -i \"s/random_seed = nu_seed/random_seed = ${RND}/g\" %s_R%s_SR%s_E%s.cfg'%(particle, run, subrun, event))
      os.system('RND=`echo \"scale=9;$RANDOM/32767*900000000\" | bc | cut -d\'.\' -f1`; sed -i \"s/random_seed = el_seed/random_seed = ${RND}/g\" %s_R%s_SR%s_E%s.cfg'%(particle, run, subrun, event))
      os.system('runND280 -c \"%s_R%s_SR%s_E%s.cfg\"'%(particle, run, subrun, event))
      os.system('mv %s_R%s_SR%s_E%s.cfg nd280_cfg'%(particle, run, subrun, event)) 
      os.system('mv *g4mc*%s*root nd280_g4mc'%tag)
      os.system('mv *elmc*%s*root nd280_elmc'%tag)
      os.system('mv *cali*%s*root nd280_cali'%tag)
      os.system('mv *reco*%s*root nd280_reco'%tag)
      os.system('mv *%s*log nd280_logs'%tag)
      os.system('mv *%s*dat nd280_dats'%tag)
      os.system('mv *%s*mac nd280_macs'%tag)
      os.system('mv *%s*.status nd280_logs'%tag)
		


def main():
  #build the work list that threads will pick from
  wrkQ = Queue() 
  os.system('mkdir nd280_g4mc')
  os.system('mkdir nd280_macs')
  os.system('mkdir nd280_elmc')
  os.system('mkdir nd280_cali')
  os.system('mkdir nd280_reco')
  os.system('mkdir nd280_logs')
  os.system('mkdir nd280_dats')
  os.system('mkdir nd280_cfg')

  vertexfile = open('./data/vertexSkim.txt','r')
  events = vertexfile.readlines()
  for e in events:
    e = e.strip()
    data = e.split()
    print 'Adding event %s to Queue'%data[2]
    print data
    print '\n'
    glbls.runlist.append(int(data[2]))
    glbls.events.append(data)

  for event in glbls.runlist: 
    wrkQ.put(event)

  for i in range(glbls.nthreads):
    pf = Process(target=runFilterThread, args=(i,wrkQ))
    glbls.thrdlist.append(pf)
    #pfs.append(pf)
    pf.start()
  
  for thrd in glbls.thrdlist: thrd.join()
	

if __name__ == '__main__':
	main()

