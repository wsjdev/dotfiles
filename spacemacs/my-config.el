(defun my-config ()
  (setq
   ;; EOF に改行を自動挿入
   require-final-newline t
   ;; ロックファイル (.#file-name) を生成しない
   create-lockfiles nil
   ;; エラー吹き出し持続時間を 10 分に
   flycheck-pos-tip-timeout 600
   )

  ;; vim
  ;; C-h にバックスペースを割り当てる
  (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))
  (define-key key-translation-map (kbd "C-?") (kbd "C-h"))
  ;; (evil-ex-define-cmd "q[uit]" (lambda ()
  ;;                                (interactive)
  ;;                                (condition-case err-var (delete-window)
  ;;                                  (error (kill-this-buffer)))))
  ;; (evil-ex-define-cmd "wq[uit]" (lambda ()
  ;;                                 (interactive)
  ;;                                 (save-buffer)
  ;;                                 (condition-case err-var (delete-window)
  ;;                                   (error (kill-this-buffer)))))

  ;; eww
  ;; google 先生を使用
  ;; (setq eww-search-prefix "https://www.google.co.jp/search?q=")
  ;; duckduckgo 日本語検索
  (setq eww-search-prefix "https://duckduckgo.com/html/?kl=jp-jp&q=")

  ;; GUI モード
  (if window-system
      (progn
        ;; (unless (eq system-type 'darwin)
        ;; 半透明に設定
        ;; (set-frame-parameter nil 'alpha 85))
        ;; フルスクリーンで起動
        (set-frame-parameter nil 'fullscreen 'fullboth)
        ;; OS とクリップボードを共有
        (setq x-select-enable-clipboard t)))

  ;; org
  ;; 見た目のインデント
  (setq-default org-startup-indented t)
  ;; アジェンダ
  (setq org-agenda-files (list "~/Dropbox/org"))
  ;; 状態
  (setq org-todo-keywords
        '((sequence "TODO(t)" "STARTED(s)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)" "CANCEL(c)")))

  ;; Ruby
  ;; Ruby マジックコメント削除
  ;; (setq ruby-insert-encoding-magic-comment nil)
  (defun remove-enh-magic-comment ()
    (remove-hook 'before-save-hook 'enh-ruby-mode-set-encoding t))
  (add-hook 'enh-ruby-mode-hook 'remove-enh-magic-comment)
  ;; 保存時の Ruby 自動整形
  (add-hook 'enh-ruby-mode-hook (lambda ()
                                  (add-hook
                                   'after-save-hook
                                   'rubocop-autocorrect-current-file
                                   nil
                                   'local)
                                  ;; 結果をポップウィンドウに表示する
                                  (push `(,(concat (concat "\*RuboCop " buffer-file-name) "\*")
                                          :height 0.5 :stick t) popwin:special-display-config)))

  ;; 英和辞書
  (require 'google-translate-default-ui)
  (defvar google-translate-english-chars "[:ascii:]"
    "これらの文字が含まれているときは英語とみなす")
  (defun trans (&optional string)
    "region か現在位置の単語を翻訳する C-u 付きで query 指定も可能"
    (interactive)
    (setq string
          (cond ((stringp string) string)
                (current-prefix-arg
                 (read-string "Google Translate: "))
                ((use-region-p)
                 (buffer-substring (region-beginning) (region-end)))
                (t
                 (thing-at-point 'word))))
    (let* ((asciip (string-match
                    (format "\\`[%s]+\\'" google-translate-english-chars)
                    string)))
      (run-at-time 0.1 nil 'deactivate-mark)
      (google-translate-translate
       (if asciip "en" "ja")
       (if asciip "ja" "en")
       string)))

  (push '("\*Google Translate\*" :height 0.5 :stick t) popwin:special-display-config))

(provide 'my-config)
