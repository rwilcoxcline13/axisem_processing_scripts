#A BASH script to group processed data by seismic station

#Specify the directory where the models are located.
cd /home/rwcline/axisem-9f0be2f/SOLVER/5_second_runs


#Specify the directory to loop through. All runs and corresponding directories
#being with a common identifier based on the type of
#perturbation (in this case Gradient)

for d in Gradient*/;
do
  cd $d

  stations=($(awk '{print $1}' STATIONS))

  cd Data_Postprocessing/SEISMOGRAMS/

  for i in "${stations[@]}"
  do
    mkdir $i
    mv $i*.dat $i
  done
  cd /home/rwcline/axisem-9f0be2f/SOLVER/5_second_runs
done
