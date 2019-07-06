## Usage

### 1. Run julius 

```sh
$ cd dictation-kit-path/
$ ./run-osx-dnn.sh "-module"
```

### 2. Open eshell

```elisp
;; M-x eshell
$ ruby julius.rb >> #<buffer julius-emacs.log>
```

### 3. Start timer

```elisp
(setq my-observe-timer (run-with-idle-timer 0.5 t 'my-observe))
```

### 3. Say something

For example

+ "コピー"
+ "貼り付け"
