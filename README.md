# Julius Emacs

Control Emacs with Voice

## Setup 

+ Install [Julius](https://github.com/julius-speech/julius)
+ Install [Ruby](https://www.ruby-lang.org/en/)

## Usage

### 1. Run Julius on Terminal

See [julius](https://github.com/julius-speech/julius), [dictation-kit](https://github.com/julius-speech/dictation-kit)  
For example, on macOS, you should run it as module-mode like below

```sh
$ cd dictation-kit-path/
$ ./run-osx-dnn.sh "-module"
```

### 2. Open eshell and Run ruby script

+ `julius.rb` is Ruby wrapper for Julius
  + It simply outputs the voice-recognition's result

```elisp
;; M-x eshell then
$ ruby julius.rb >> #<buffer julius-emacs.log>
```

### 3. Start observation for voice-recognition

```elisp
;; start observation
M-x start-julius-emacs-buffer-observe

;; stop observation
M-x stop-julius-emacs-buffer-observe
```

### 4. Say something

For example, as default, this package recognizes...

+ "コピー": `(kill-new (thing-at-point 'symbol))`
+ "貼り付け": `(yank)`
