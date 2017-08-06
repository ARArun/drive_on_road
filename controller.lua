function driveAsCar(forwardSpeed,angularSpeed)
	--Positive angular speed Left Turn
	--Negative angular speed Right Turn
	--Zero angular speed straight
	leftSpeed=forwardSpeed-angularSpeed
	rightSpeed=forwardSpeed+angularSpeed
	robot.wheels.set_velocity(leftSpeed,rightSpeed)
end
function init(  )
	-- body

end

function step()

  sensingLeft=robot.proximity[3].value+robot.proximity[4].value+robot.proximity[5].value+robot.proximity[6].value+robot.proximity[2].value+robot.proximity[1].value
  sensingRight=robot.proximity[19].value+robot.proximity[20].value+robot.proximity[21].value+robot.proximity[22].value+robot.proximity[24].value+robot.proximity[23].value

	if(sensingLeft ~=0)then
		log("Turning Right")
		driveAsCar(7,-3)
	elseif(sensingRight ~= 0)then
		driveAsCar(7,3)
		log("Turning Left")
  elseif(robot.motor_ground[1].value > 0.40) then -- no road on my left
    driveAsCar(5,-4)
elseif(robot.motor_ground[4].value > 0.40) then -- no road on my right
    driveAsCar(5,4)
  else
    driveAsCar(10,0)
  end

end

function reset()

end

function destroy()

end
