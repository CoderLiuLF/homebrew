require 'formula'

class BootxCli < Formula
  homepage 'https://www.dtstack.com/'
  url 'https://dtstack-static.oss-cn-hangzhou.aliyuncs.com/dt-bootx/dt-bootx-cli-1.0.0-SNAPSHOT.tar.gz'
  version '1.0.0-SNAPSHOT'
  sha256 'a4764c91bd8fcd045f5a548aeec780e212a9ef527eb02ed5d504f8f4a5f97bb1'

  bottle :unneeded
  depends_on :java

  def install
  	rm Dir["*.bat"]
    mv "boot-cli.sh", "boot-cli"
    chmod 0755, "boot-cli"

    libexec.install Dir["*"]
    (bin/"boot-cli").write_env_script(libexec/"boot-cli", Language::Java.java_home_env)
  end
end
