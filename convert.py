from subprocess import call,check_output
import sys
import os

def convert(mdfolder, file):
    print("processing file: {}".format(file))
    projectfolder = os.getcwd()
    uid = check_output(["id", "-u"]).rstrip()
    gid = check_output(["id", "-u"]).rstrip()
    file = file[:-3]
    command = "docker run --name pandoc --rm=true -u {5}:{6} -v {3}:/vagrant \
      -v {4}:/template \
      pandoc -o result/{0}.html -s \
      -V theme={1} \
      --no-highlight \
      --template=/template/template.html \
      -V transition={2} \
      -V revealjs-url=https://cdn.jsdelivr.net/reveal.js/3.0.0 \
      --self-contained \
      -t revealjs {0}.md" \
        .format(file, "serif", "fade", mdfolder, projectfolder, uid, gid) \
        .split()

    call(command)
    return


mdfolder = sys.argv[1]
if not os.path.exists(mdfolder + "/result"):
    os.makedirs(mdfolder + "/result")

for file in os.listdir(mdfolder):
    if file.endswith(".md"):
        convert(mdfolder, file)
