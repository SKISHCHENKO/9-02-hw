# Домашнее задание к занятию "GitLab" - Кищенко Сергей FOPS-41


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---


## Задание 1

** Описание:**
Что нужно сделать:

Разверните GitLab локально, используя Vagrantfile и инструкцию, описанные в этом репозитории.  
Создайте новый проект и пустой репозиторий в нём.  
Зарегистрируйте gitlab-runner для этого проекта и запустите его в режиме Docker. Раннер можно регистрировать и запускать на той же виртуальной машине, на которой запущен GitLab.  
В качестве ответа в репозиторий шаблона с решением добавьте скриншоты с настройками раннера в проекте.  

![alt text](https://github.com/SKISHCHENKO/8-03-hw/blob/main/img/task1_1.jpg)

![alt text](https://github.com/SKISHCHENKO/8-03-hw/blob/main/img/task1_2.jpg)

![alt text](https://github.com/SKISHCHENKO/8-03-hw/blob/main/img/task1_3.png)



---

### Задание 2

** Описание:**
Что нужно сделать:

Запушьте репозиторий на GitLab, изменив origin. Это изучалось на занятии по Git.  
Создайте .gitlab-ci.yml, описав в нём все необходимые, на ваш взгляд, этапы.  
В качестве ответа в шаблон с решением добавьте:  

файл gitlab-ci.yml для своего проекта или вставьте код в соответствующее поле в шаблоне;  
скриншоты с успешно собранными сборками.  

Файл .gitlab-ci.yml:  
```
stages:
  - info
  - lint
  - test
  - build

# Кэш для ускорения повторных сборок
cache:
  key: "go-${CI_COMMIT_REF_SLUG}"
  paths:
    - /go/pkg/mod/       # модули
    - /go/cache/         # go build/test cache

ci_info:
  stage: info
  image: alpine:3.19
  # tags: ["docker"]
  script:
    - uname -a | tee ci_info.txt
    - 'echo "Runner: ${CI_RUNNER_DESCRIPTION:-unknown}" | tee -a ci_info.txt'
  artifacts:
    when: always
    expire_in: 7 days
    paths:
      - ci_info.txt

# 1) Go lint (go vet)
go_lint:
  stage: lint
  image: golang:1.22
  # tags: ["docker"]
  variables:
    GOPATH: /go
    GOCACHE: /go/cache
    CGO_ENABLED: "0"
  before_script:
    - |
      if [ ! -f go.mod ]; then
        go mod init ${CI_PROJECT_PATH//\//_}
      fi
    - go mod tidy
  script:
    - go vet ./...

# 2) Тесты с покрытием
go_test:
  stage: test
  image: golang:1.22
  # tags: ["docker"]
  variables:
    GOPATH: /go
    GOCACHE: /go/cache
    CGO_ENABLED: "0"
  before_script:
    - |
      if [ ! -f go.mod ]; then
        go mod init ${CI_PROJECT_PATH//\//_}
      fi
    - go mod tidy
  script:
    - go test ./... -v -coverprofile=coverage.out | tee test-report.txt
  artifacts:
    when: always
    expire_in: 7 days
    paths:
      - test-report.txt
      - coverage.out

# 3) Сборка бинарника
go_build:
  stage: build
  image: golang:1.22
  # tags: ["docker"]
  variables:
    GOPATH: /go
    GOCACHE: /go/cache
    CGO_ENABLED: "0"
  before_script:
    - |
      if [ ! -f go.mod ]; then
        go mod init ${CI_PROJECT_PATH//\//_}
      fi
    - go mod tidy
  script:
    - mkdir -p bin
    - go build -o bin/hello .
    - file bin/hello || true
    - ./bin/hello world | tee run-output.txt
  artifacts:
    name: "hello-${CI_COMMIT_SHORT_SHA}"
    expire_in: 7 days
    paths:
      - bin/hello
      - run-output.txt


```

![alt text](https://github.com/SKISHCHENKO/8-03-hw/blob/main/img/task2_1.jpg)

![alt text](https://github.com/SKISHCHENKO/8-03-hw/blob/main/img/task2_2.png)


