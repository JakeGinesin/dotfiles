" note do not change the order...
" some of them are overridding privous regrex 

"this code made with build-in syntax regrex(and key words), and with some custome regrex(and
"key words)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" gruvbox (dark)
let orange = "#fe8019" "special color for numbers
let black = "#282828"
let red = "#fb4934"
let green = "#b8bb26"
let yellow = "#fabd2f"
let blue = "#458588"
let purple = "#d3869b"
let cyan = "#8ec07c"
let white = "#ebdbb2"


" you may chage the color according to your will :)


" main color (for left over words)
syn match main "\w"
execute "highlight main ctermfg=4  guifg=".white

" highlight operators
syn match operator "[-+&|<>=!\/~:*%^?]"
execute "highlight operator ctermfg=4  guifg=".orange


" method names()
syn match class "\w*\((\)\@="
execute "highlight class ctermfg=4  guifg=".green

" imported packages 
syn match importName "\v(^import\s+)@<=.*;"
execute "highlight importName ctermfg=4  guifg=".yellow

" import 
syn match importWord "import "
execute "highlight importWord ctermfg=4  guifg=".yellow

" package name
syn match packageName "\v(^package\s+)@<=.*;"
execute "highlight packageName ctermfg=4  guifg=".green

"ex: int, double, char
execute "highlight javaType ctermfg=4  guifg=".yellow

"class name... basically starts with caps letter
syntax match ClassName display '\<\([A-Z][a-z0-9]*\)\+\>'
syntax match ClassName display '\.\@<=\*'
highlight link ClassName Identifier
execute "highlight ClassName ctermfg=4  guifg=".yellow

" Just some special color, why not?  
"syn match print " System.out."
"execute "highlight print ctermfg=4  guifg=".yellow

"objects (ex: String) 
execute "highlight Constant ctermfg=4  guifg=".yellow

" class
syn match javaClassDecl2 " class\> "
execute "highlight javaClassDecl2 ctermfg=4  guifg=".orange

" package
execute "highlight javaExternal ctermfg=4  guifg=".cyan

"if else switch
execute "highlight javaConditional ctermfg=4  guifg=".red

"while for do 
execute "highlight javaRepeat ctermfg=4  guifg=".red

"true flase
execute "highlight javaBoolean ctermfg=4  guifg=".purple


" null
"syn match null "\v[ ]null([  ]|[; ])"
execute "highlight javaConstant ctermfg=4  guifg=".purple


" this super
execute "highlight javaTypedef ctermfg=4  guifg=".cyan
		
" var new instanceof
execute "highlight javaOperator ctermfg=4  guifg=".white
	
" return
execute "highlight javaStatement ctermfg=4  guifg=".red

" static synchronized transient volatile final strictfp serializable
execute "highlight javaStorageClass ctermfg=4  guifg=".orange

"throw try catch finally
execute "highlight javaExceptions ctermfg=4  guifg=".red

" assert
execute "highlight javaAssert ctermfg=4  guifg=".red

" synchronized throws
execute "highlight javaMethodDecl ctermfg=4  guifg=".red

" extends implements interface
execute "highlight javaClassDecl ctermfg=4  guifg=".blue

" break continue skipwhite
execute "highlight javaBranch ctermfg=4  guifg=".red

" public protected private abstract
execute "highlight javaScopeDecl ctermfg=4  guifg=".orange

" highlight semicolon
syn match semi "[;]"
execute "highlight semi ctermfg=4  guifg=".white



""""""""""""""""""""""""""""""""""""""'
" java 9...
" module transitive
execute "highlight javaModuleStorageClass ctermfg=4  guifg=".orange


" open requires exports opens uses provides 
execute "highlight javaModuleStmt ctermfg=4  guifg=".yellow


" to with
execute "highlight javaModuleExternal ctermfg=4  guifg=".red


"""""""""""""""""""""""""""""""""""""""""
" lambda
execute "highlight javaLambdaDef ctermfg=4  guifg=".red


""""""""""""""""""""""""""""""""""""""""""
" clone equals finalize getClass hashCode
" notify notifyAll toString wait
execute "highlight javaLangObject ctermfg=4  guifg=".green





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

