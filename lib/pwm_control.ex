# lib/pwm_control.ex
defmodule PwmControl do
  require Logger

  @pwm_path "/sys/class/pwm/pwmchip0"

  def start do
    File.write("#{@pwm_path}/export", "0")
    Process.sleep(100)
    File.write("#{@pwm_path}/pwm0/period", "1000000")
    File.write("#{@pwm_path}/pwm0/enable", "1")
  end

  def set_duty(percent) when percent >= 0 and percent <= 100 do
    duty = trunc(1_000_000 * percent / 100)
    File.write("#{@pwm_path}/pwm0/duty_cycle", "#{duty}")
  end
end
