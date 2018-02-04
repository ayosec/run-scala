def cmd(*args)
  STDERR.puts "\033[34m#{args.join(" ")}\033[m" if O.verbose
  if not system(*args)
    STDERR.puts "\033[31mFailed\033[m"
    exit 1
  end
end

def cmd_replace(*args)
  STDERR.puts "\033[34m#{args.join(" ")}\033[m" if O.verbose
  exec(*args)
end
