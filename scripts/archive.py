import os, shutil, sys
files = os.listdir("./new/")

i = 0

def progress(count, total, status=''):
    bar_len = 60
    filled_len = int(round(bar_len * count / float(total)))

    percents = round(100.0 * count / float(total), 1)
    bar = '=' * filled_len + '-' * (bar_len - filled_len)

    sys.stdout.write('[%s] %s%s ...%s\r' % (bar, percents, '%', status))
    sys.stdout.flush() 

for file in files:
    shutil.make_archive(file, "zip", "./new/"+file)
    progress(i, len(files), status='')
    i = i + 1
