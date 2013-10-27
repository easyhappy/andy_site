class AdminBackup
  REMOTE_PATH = "test/"
  def self.backup
    file_name = "/home/andy/backups/*/*/*.tar "
    stdout = Open4::popen4 "backup perform --trigger my_backup; ls #{file_name};baidupan upload #{file_name} #{REMOTE_PATH}"
    info = stdout[2].to_a.join("<br/>")
    info += "<br/>"
    info += stdout[3].to_a.join("<br/>")
  end

  def self.backup_list
    stdout = Open4::popen4 "baidupan ls #{REMOTE_PATH}"
    stdout[2].to_a.join("<br/>")
  end
end