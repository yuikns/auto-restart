import os

id = 0

def do_func():
  global id
  id = id + 1
  print("('recognizing', ObjectId('5a688ff935842e2f9d1929f7'), ObjectId('5980946f421aa95ae1afd663'), "+str(id)+")")
  if id % 5 == 4:
    os.abort()

def unsafe_func():
  while True:
    do_func()

if __name__ == "__main__":
    unsafe_func()
