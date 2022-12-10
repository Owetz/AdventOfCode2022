global with sharing class AdventOfCode7 {
    public final List<String> PuzzleInput = AdventOfCode2022Utilities.getStaticResource('AdventOfCode7').split('\n');

    public AdventOfCode7() {
        //System.debug(PuzzleInput);
    }

    public Folder createFolder(String name){
        return new Folder(name);
    }

    public File createFile(String name, Integer size){
        return new File(name, size);
    }

    global class Folder {

        public String name {get;set;}
        public Integer folderSize {
            get { return folderSize;}
            set { 
                folderSize = value; 
                if(this.parent != null){this.parent.folderSize =+ value;}
            }
        }
        public List<Object> content {get;set;}
        public Folder parent {get;set;}

        public Folder(String name){
            this(name, 0, new List<Object>());
        }

        public Folder(String name, Integer size, List<Object> content){
            this.name = name;
            this.folderSize = size;
            this.content = content;
        }

        public void addItem(File file){
            this.content.add(file);
            this.folderSize = this.folderSize + file.size;
        }

        public void addItem(Folder folder){
            this.content.add(folder);
            this.folderSize = this.folderSize + folder.folderSize;
            folder.parent = this;
        }

    }

    global class File {
        global String name {get;set;}
        global Integer size {get;set;}

        global File(String name, Integer size){
            this.name = name;
            this.size = size;
        }
    }
}