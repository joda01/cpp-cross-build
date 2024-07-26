 triple="x86_64-apple-darwin23"
 


 for bin in /usr/osxcross/bin/$triple-*; do            
    echo "$bin"                                      
        ln /usr/bin/osxcross-wrapper /usr/$triple/bin/$(basename $bin | sed "s/$triple-//");      
done    