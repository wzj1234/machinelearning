import sys
import json

pythonPath = sys.argv[1]
with open(pythonPath+'/sample_X_final.json','r') as f:
	sample=json.load(f)
	f.close()
print(len(sample),len(sample[0]))
# print(len(sample[0]))

from sklearn.preprocessing import normalize
sample = normalize(sample,norm="l2").tolist()
with open(pythonPath+"/sample_X_final.json",'w') as fp:
	json.dump(sample,fp)

print("normalize end")