pipelineJob("node-jenkins-demo") {
    description('This is my 1st pipeline created from a SeedJob using my remote-jenkins on Azure!')

    definition {
        cpsScm {
            lightweight()
            scm {
                git {
                    branch('main')
                    remote {
                        credentials('github-jenkins-token')
                        github('gerardovitale/node-jenkins-demo' , 'https', 'github.com')
                    }
                }
            }
        }
    }

    triggers {
        githubPush()
    }

}
