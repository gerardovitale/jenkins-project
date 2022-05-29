pipelineJob("covid-19-project") {
    description('Pipeline for covid-19-project')

    definition {
        cpsScm {
            lightweight()
            scm {
                git {
                    branch('main')
                    remote {
                        credentials('github-jenkins-token')
                        github('gerardovitale/covid-19-project' , 'https', 'github.com')
                    }
                }
            }
        }
    }

    triggers {
        githubPush()
    }

}
