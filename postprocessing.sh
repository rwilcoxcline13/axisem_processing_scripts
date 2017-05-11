#A BASH Script to run axisem post_processing on multiple runs

#Specify directory where data is located. It will always be located in the SOLVER
#directory
cd /home/rwcline/axisem-9f0be2f/SOLVER/5_second_runs


#Specify model directories. All Directories begin with a common identifier, in
#this case Gradient

for d in Gradient*/;
do
  cd $d
  ./post_processing.csh
  cd /home/rwcline/axisem-9f0be2f/SOLVER/5_second_runs

done
