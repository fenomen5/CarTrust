USE [dbcartrust]
GO
DELETE FROM [dbo].[visit_service]
GO
DELETE FROM [dbo].[users]
GO
DELETE FROM [dbo].[user_visit]
GO
DELETE FROM [dbo].[user_stat]
GO
DELETE FROM [dbo].[service_image]
GO
DELETE FROM [dbo].[service_category]
GO
DELETE FROM [dbo].[service]
GO
DELETE FROM [dbo].[scheduled_visit]
GO
DELETE FROM [dbo].[promo]
GO
SET IDENTITY_INSERT [dbo].[promo] ON 

INSERT [dbo].[promo] ([id], [promo_name], [file_name]) VALUES (6, N'Car service 50%', N'carservicing_promo_banner.png')
INSERT [dbo].[promo] ([id], [promo_name], [file_name]) VALUES (8, N'brake discount 40', N'brake_promo_banner.png')
INSERT [dbo].[promo] ([id], [promo_name], [file_name]) VALUES (9, N'Windshield replacement 30%', N'windshield_promo_banner.png')
SET IDENTITY_INSERT [dbo].[promo] OFF
SET IDENTITY_INSERT [dbo].[scheduled_visit] ON 

INSERT [dbo].[scheduled_visit] ([id], [visit_time], [visitor_name], [visitor_email], [visitor_car_model], [visitor_car_released]) VALUES (1, N'2019-10-29 00:00', N'Michael', N'micj@gmail.com', N'Toyota Corolla', 2007)
INSERT [dbo].[scheduled_visit] ([id], [visit_time], [visitor_name], [visitor_email], [visitor_car_model], [visitor_car_released]) VALUES (2, N'2019-11-05 00:00', N'Philipp', N'phil@gmail.com', N'Nissan Qashqai', 2014)
SET IDENTITY_INSERT [dbo].[scheduled_visit] OFF
SET IDENTITY_INSERT [dbo].[service] ON 

INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (1, N'Windscreen Replacement', CAST(600 AS Decimal(18, 0)), 1, N'A glass technician removes the trim around the inside and outside perimeter of the windscreen, as well as the rearview mirror
The sealant on the perimeter of the windscreen is cut using a wire saw
The technician along with an assistant lift the damaged windscreen out using industrial-strength suction cups with handles
The old sealant is cleaned and a new bead of sealant is applied to the mounting surface
A new windscreen is lowered into place and seated into the sealant
The trim is refitted to the exterior and interior
The windscreen is secured with adhesive tape temporarily while the sealant cures')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (5, N'Side Window Replacement', CAST(300 AS Decimal(18, 0)), 1, N'The vehicle is vacuumed to remove any broken glass before work can start.
Depending on which window requires replacing, the door trim and other components will be removed.
The remains of the old window will be removed off the window regulator, and any debris inside the door removed.
The new window will be carefully inserted and attached to the window regulator.
The door trim and other components will be refitted and the operation of the window and regulator tested.
The new glass will be cleaned of any marks from installation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (6, N'Windscreen Chip Repair', CAST(40 AS Decimal(18, 0)), 1, N'It is recommended to get an expert to repair a windscreen chip.

However, if you feel like having a go yourself, there are Windscreen Repair Kits available that range in price from $8 to $70.

Here’s how the professionals go about it:

They will Inspect the impact area

Remove loose glass fragments from the chip with a probe or drill into the impact area. Only drilling into the top layer of glass and not into the laminate or bottom glass layers. This allows easy access to the air pocket and for applying the resin.

Clean the site or blow away any fragments with compressed air

Place a mirror or white piece of paper on the inside of the windscreen, to aid in the viewing of the chip

Fix a positioning tool to the windscreen to hold the resin injector in place. The injector creates a vacuum, allowing resin to enter the void while air is being removed. The more effective this vacuum is makes for better results

Resin is placed into the injector then held in place onto the windscreen creating a seal directly over the area to be repaired

Resin is then forced through the injector into the windscreen numerous times, in cycles, for around 10 minutes.

The vacuum forces the resin in while the air is sucked out of the windscreen. You will see bubbles of air escaping through the resin as the two switch places.

A UV lamp is then placed at the site to cure the resin. This takes around a minute

The injector and positioning tool is removed

More resin is then used to fill in the dent/pit that remains on the surface of the windscreen

A clear plastic or curing film is then placed over the resin, stopping the resin from creating a bulbous bubble on the windscreen

The UV lamp is used again on the site for 30 seconds to cure the resin

They carefully remove the film and use a razor blade to remove any excess adhesive from the windscreen

Then finish with a polish and a clean')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (7, N'Rear Window Replacement', CAST(500 AS Decimal(18, 0)), 1, N'The glass technician will remove the rear wiper blade (if fitted) and the inner rear trim to allow complete access to the window
The demister will be disconnected from the tabs
The rear sealant will be cut and the rear window will be removed
The old sealant will be cleaned up, and a new bead of sealant applied to the window frame
The new rear window will be secured in position
The removed trims and wiper blade will be refitted, and the demister reconnected to the tabs
The rear window will be secured with tape while the sealant sets, and the demister and wiper will be tested for correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (8, N'Front Brake Pad Replacement', CAST(200 AS Decimal(18, 0)), 2, N'The vehicle is raised and the wheels removed
The brake pads and discs are inspected
If the brake pads are worn down, the old pads will be removed
The brake calipers will be inspected and the new brake pads installed
The wheels will be refitted and the new brake pads will be ‘bedded in’
The vehicle will be road tested to ensure correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (9, N'ABS/Wheel Speed Sensor Replacement', CAST(400 AS Decimal(18, 0)), 2, N'The technician performs a diagnostic test on the ABS system
The car is lifted and the affected wheel is removed
The ABS sensor wiring connector is unfastened and checked for damage
The ABS sensor is unbolted from the wheel knuckle. In many cases, the ABS sensor is integrated in the wheel hub, which must be replaced as an assembly
The new ABS sensor is fitted and secured
The wheel is reinstalled and the car lowered
The technician clears related ABS codes and performs a road test to confirm the repair')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (10, N'Front Brake Pad and Rotor Replacement', CAST(500 AS Decimal(18, 0)), 2, N'The vehicle will be raised and the front wheels removed
The brake pads and disc will be inspected for wear
If the brake pads and discs are worn down, they will be removed from the vehicle
The new disc rotors will be installed and the brake calipers will be inspected
The new brake pads will be fitted and the front wheels reinstalled
The brake pads and disc rotors will be ‘bedded in’ and a road test will be carried out to ensure correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (11, N'Rear Brake Pad Replacement', CAST(300 AS Decimal(18, 0)), 2, N'The vehicle will be raised up and the rear wheels removed
The brake pads will be inspected for wear, as well as the disc rotors and other brake components
If the brake pads are worn, they will be removed from the vehicle
The calipers will be inspected and the handbrake adjusted (if part of the caliper)
The new brake pads will be fitted and the wheels reinstalled
The brake pads will be ‘bedded in’ and the vehicle road tested for correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (12, N'Rear Brake Pad and Rotor Replacement', CAST(500 AS Decimal(18, 0)), 2, N'The vehicle will be raised and the rear wheels removed
The rear brake pads and disc rotors will be inspected for wear and damage
If the brake pads and disc rotors are worn excessively, they will be removed from the vehicle
The new disc rotors will be installed, the handbrake reset (if required) and the calipers inspected
The new brake pads will be fitted and the rear wheels reinstalled on the vehicle
The brake pads and disc rotors will be ‘bedded in’ and the vehicle road tested to ensure correct braking operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (13, N'Brake System Flush', CAST(90 AS Decimal(18, 0)), 2, N'The mechanic will inspect the condition of the fluid, and if it requires changing, will drain the braking system reservoir and fill it with new fluid.

The vehicle will be raised up to allow access to the brake calipers and drums (if fitted) and the brake fluid will be pumped through via a hand-held vacuum pump or atmospheric pressure, starting at the caliper or drum furthest away from the reservoir.

Once the fluid has been flushed through thoroughly, the reservoir will be topped up and the braking system tested for correct operation.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (14, N'Brake Caliper Replacement', CAST(400 AS Decimal(18, 0)), 2, N'The technician lifts the car in the air or places the affected wheel on a jack stand and the wheel is removed
The brake caliper mounting bolts are removed and the brake caliper lifted from its mount
The brake fluid hose is disconnected
If the brake pads are to be reused, the technician transfers them to the new caliper
The brake fluid hose is fitted to the new caliper and the brake caliper is bolted into place
The brakes are bled, removing air from the braking system
The wheel is refitted and the car is road tested to confirm the repair')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (15, N'Brake Light Bulb Replacement', CAST(20 AS Decimal(18, 0)), 2, N'The boot is opened and the taillamp assembly is removed
The brake light bulb socket is removed from the housing
The burnt-out bulb is removed from the socket and a new bulb is fitted
The taillamp assembly is refitted and the technician confirms the bulb’s operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (16, N'Brake Drum Replacement', CAST(320 AS Decimal(18, 0)), 2, N'The car is lifted and the rear wheels are removed
The brake drums are removed from the wheel spindle
Brake drums are inspected and measured
Worn or damaged brake drums are replaced, often along with brake shoes and hardware
The rear brakes are adjusted and the rear wheels refitted
The car is lowered and the technician road tests to confirm the repair is complete')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (17, N'Brake Hose Replacement', CAST(190 AS Decimal(18, 0)), 2, N'The car is lifted and the wheel is removed
The brakes are inspected and the faulty brake hose identified
The brake hose is disconnected from the steel brake line and the brake caliper or drum
A new hose is fitted
Brake fluid is topped up in the reservoir and the brakes are bled
A technician performs a road test to confirm the repair is complete')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (18, N'Clutch Replacement', CAST(1400 AS Decimal(18, 0)), 3, N'Our mechanics will remove the transmission of the vehicle, and replace the clutch and pressure plate, and the flywheel and slave cylinder (If required, at additional cost) The clutch fluid will be changed, a bedding in procedure will be carried out, and a test drive completed, to ensure correct operation of the system.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (19, N'Clutch Fluid Replacement', CAST(90 AS Decimal(18, 0)), 3, N'The technician inspects the clutch system for leaks and component condition.
The clutch bleeder valve is located and a drain hose it attached.
While the clutch pedal is pressed, the bleeder valve is opened to expel fluid a little at a time, then closed before the clutch pedal is released.
The process is repeated while new fluid is topped up in the reservoir, until the fluid coming out of the bleeder valve is clean.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (20, N'Clutch Master Cylinder Replacement', CAST(360 AS Decimal(18, 0)), 3, N'The bonnet it lifted and the clutch master cylinder fluid condition and operation is inspected
The clutch fluid line is disconnected and the clutch master cylinder is unbolted from the car
A new clutch master cylinder is fitted, the fluid line is attached, and the reservoir is filled with new, clean fluid
The clutch system is bled of air
The technician performs a road test to confirm clutch operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (21, N'Clutch cable replacement', CAST(150 AS Decimal(18, 0)), 3, N'The clutch cable will be unbolted and detached from any clips or brackets from the foot pedal to the clutch
The cable will be pulled through the firewall out into the engine bay
The new cable will be pushed through the firewall and bolted or clipped back into place at the clutch foot pedal
The cable will be positioned back into place inside the engine bay and bolted or clipped back onto the clutch fork
A clutch cable adjustment will be carried out to make sure the clutch is engaging correctly
Vehicle is test driven to check for correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (22, N'Clutch Cable Adjustment', CAST(70 AS Decimal(18, 0)), 3, N'Not all clutch cables are the same.

You should consult your owner manual before attempting this one, if at all.

Ideally, it would be in your best interest to have an expert adjust the clutch cable and this can be done by booking an AutoGuru quality mechanic.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (23, N'Air-Conditioner Replacement', CAST(700 AS Decimal(18, 0)), 4, N'The A/C system will be checked for pressure and level
The compressor power and ground will be checked
Once the issue has been found, the refrigerant will be removed
The repair or component replacement will be carried out
The system will be flushed out to remove any contamination
The air conditioning system will be evacuated and new refrigerant will be added
The system will be checked for leaks and correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (24, N'Air Conditioner Condenser Replacement', CAST(700 AS Decimal(18, 0)), 4, N'The condenser will be visually inspected for any leaks or damage
The air conditioning system pressure will be checked
If the condenser requires replacement, any gas in the system will be removed
In most cases, the front bumper will be removed to allow access to the condenser
The old condenser will be removed and a new one installed along with new ‘O’ rings
The air conditioning system will be evacuated and new gas injected into the system
The system will be tested for correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (25, N'Air Conditioning Re-Gas', CAST(100 AS Decimal(18, 0)), 4, N'The A/C system will be checked for pressure and level of refrigerant
The compressor power and ground will be checked
The refrigerant will be removed and recovered (it can be ‘cleaned’ for re use)
New refrigerant will be added into the system
A leak test will be carried out and the system checked to be working')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (26, N'Blower Motor Replacement', CAST(240 AS Decimal(18, 0)), 4, N'Replacing a blower motor is a relatively straightforward task for a trained mechanic.

After the car battery is disconnected, some trim and small panels may need to be removed from the passenger footwell.

The glove box may also have to be removed.

Being located behind the dash in the passenger footwell, the blower motor can be easily accessed and removed by undoing the bolts that are securing it.

On some older model cars, the blower motor might be located in the engine bay.

Once free, the HVAC vent connections are detached, along with the electrical power connector.

This process is then reversed in order to install the new blower motor and gasket (if applicable).')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (27, N'Air Conditioning High-Pressure Hose Replacement', CAST(600 AS Decimal(18, 0)), 4, N'A leak test may be performed
The refrigerant will be removed from the system
The damaged or failed high-pressure hose will be removed and a new one installed
Air is removed from the system by vacuum and the system is recharged
AC pressure and temperature may be tested
HVAC system will be tested to make sure the air conditioning is working as it should.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (28, N'Air Conditioning Pressure Switch Replacement', CAST(350 AS Decimal(18, 0)), 4, N'A/C refrigerant will be removed
A/C switch will be located
Wiring disconnected from the switch
A/C switch removed
New switch fitted
Wiring plugged back in
A/C refrigerant evacuated and refilled
A/C functionality checked')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (29, N'Wheel Bearing Replacement', CAST(300 AS Decimal(18, 0)), 5, N'Identify the faulty bearing
Remove the wheel and hub
Unbolt or press out the old bearing and fit new bearing
Refit hub to vehicle, and torque correctly
Inspect suspension and braking components and refit wheel
Road test to ensure repair has been carried out successfully')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (30, N'Steering column replacement', CAST(600 AS Decimal(18, 0)), 5, N'The technician will diagnose the issue
The battery will be disconnected and shrouds and trims removed around the steering wheel
The steering wheel will be removed and the airbag disconnected
The universal joint will be undone off the top of the steering rack
The mounting bolts will be removed and the column removed from the vehicle
The new column will be installed and the universal joint reattached
The steering wheel and airbag will be reinstalled correctly
The shrouds and trims will be reinstalled and the battery reconnected
The technician will test drive the vehicle to ensure correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (31, N'Front Shock Absorber Replacement', CAST(400 AS Decimal(18, 0)), 5, N'The shock absorbers will be inspected
If they require replacing, the wheels will be removed and the old shock absorbers discarded
The new shock absorbers will be fitted and the rest of the suspension inspected for worn or damaged components
The wheels will be refitted and the vehicle tested for correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (32, N'Rear Shock Absorber Replacement', CAST(400 AS Decimal(18, 0)), 5, N'The shock absorbers will be inspected and a ‘bounce’ test carried out
If they require replacing, the wheels will be removed and the old shock absorbers disconnected and discarded
The new shock absorbers will be fitted and the suspension and steering components inspected for wear or damage
The wheels will be refitted and the vehicle tested to ensure correct operation.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (33, N'CV Boot Replacement', CAST(190 AS Decimal(18, 0)), 5, N'The vehicle is raised and the CV boot inspected
The wheels, suspension and sway bar will be moved out of the way to allow access to the drive shaft
The Driveshaft will be removed from the vehicle and the old CV boot discarded
The CV joint will be inspected and the old grease will be cleaned out
New grease will be applied to the CV joint, and the new boot installed
The driveshaft will be refitted, along with the suspension, and the wheel re-installed
The vehicle will be road-tested to ensure to ensure correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (34, N'Suspension Bushes Replacement', CAST(400 AS Decimal(18, 0)), 5, N'The car is lifted so the wheels are off the ground, and the wheel on the affected side is removed
The ball joint undone and the control arm mounting bolts are removed
The old bushings on the control arm are pressed out
New bushings are pressed into place
The control arm is refitted and the suspension bolts are torqued to the proper spec
The car is lowered to the ground and road tested to ensure the concern is fixed')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (35, N'Power Steering Pump Replacement', CAST(600 AS Decimal(18, 0)), 5, N'The power steering pump is located, and access is created based on its position. Some cars’ power steering pump must be accessed from under the engine while others are from the top side
The power steering belt is removed
The technician disconnects the wiring connector (if equipped), and the power steering pressure and return hoses are disconnected and the fluid drained
The pump’s mounting bolts are undone, the old pump is removed, and a new pump bolted into place
Power steering lines are reattached, along with the wiring and the power steering drive belt
The power steering fluid is refilled at the reservoir and air bled from the power steering system
The car is road tested to ensure the repair is complete')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (36, N'CV Shaft Replacement', CAST(700 AS Decimal(18, 0)), 5, N'The technician lifts the car on a hoist or secures it on jack stands
The wheel is removed at the affected location
The axle nut is undone from the wheel hub and broken loose from the hub assembly
The CV shaft is removed from the transaxle or differential assembly and taken out of the car
A new CV shaft is fitted in its place, then the axle nut is torqued to spec
The wheel is refitted and the car is lowered to the ground
A road test is performed by the technician to ensure the symptom has been corrected')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (37, N'Power Steering Fluid Replacement', CAST(150 AS Decimal(18, 0)), 5, N'The technician siphons the fluid from the power steering fluid reservoir, often attached to the pump and new fluid is added
Alternately, the technician disconnects a power steering hose and fully drains the power steering system
New, clean fluid is added to the reservoir
The technician operates the power steering to circulate the clean fluid into the system, pushing out old fluid in the power steering cooler and power steering rack while ensuring the reservoir is always full
Once clean fluid comes out the disconnected power steering hose, it’s reconnected and the reservoir topped up
The technician bleeds the system and performs a road test')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (38, N'Power Steering Rack Replacement', CAST(1200 AS Decimal(18, 0)), 5, N'The technician lifts the car on a hoist or jack stands and the wheels are removed
The outer tie rods are disconnected from the steering knuckles on both sides
Power steering hoses are disconnected from the power steering rack and mounting bolts are undone
The steering shaft is disconnected from the power steering rack
The faulty power steering rack is removed and a new one fitted in its place
The tie rods, power steering hoses, and steering shaft are refitted to the new power steering rack
Wheels are re-installed and the car is lowered to the ground
A wheel alignment is performed and a road test is completed by the technician')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (39, N'Headlight Bulb Replacement', CAST(40 AS Decimal(18, 0)), 6, N'The headlights are switched on and inspected
• The fuses will be checked to ensure they are not blown
• The faulty bulb will be removed and the socket checked
• The new bulb will be fitted and tested for operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (40, N'Horn Replacement', CAST(30 AS Decimal(18, 0)), 6, N'Locate the horn
Remove any accessories or panels that may impede access to the horn
Unclip the electrical connector attached to the horn
Unbolt the horn
Compare the old horn with the new one to make sure they are the same.
Fit new horn and bolt in place
Clip in the electrical connector
Refit any accessories or panels removed to access horn
Test horn function')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (41, N'Throttle position sensor replacement', CAST(70 AS Decimal(18, 0)), 6, N'Throttle position sensor is located
Electrical connector/s from the throttle position sensor are unclipped
Throttle position sensor is removed
Old throttle position sensor compared with the new to ensure they are the same
New throttle position sensor fitted
Electrical connector/s clipped in
Functionality is tested')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (42, N'Alternator Replacement', CAST(500 AS Decimal(18, 0)), 6, N'The charging system is inspected and tested, including alternator output
The drive belts are inspected to ensure the alternator is being driven
The battery will be disconnected
The alternator will be removed and replaced if it is not charging correctly
The battery will be reconnected
The output of the alternator will be rechecked to make sure it is working correctly')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (43, N'Ignition Coil Replacement', CAST(250 AS Decimal(18, 0)), 6, N'The technician scans the OBD system to determine which cylinder’s ignition coil is faulty.
The ignition coil may be switched with another to determine if the ignition coil, in fact, needs to be replaced. If the engine code ‘follows’ the suspected coil, it needs to be changed.
The faulty coil is unseated from the spark plug or removed from its mounting location and the wiring connector is disconnected.
The new coil is installed and the wiring connected.
The technician scans the diagnostic system to ensure the fault has been corrected.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (44, N'Starter Motor Replacement', CAST(500 AS Decimal(18, 0)), 6, N'The battery is disconnected to prevent accidental shock
The car is raised on jack stands or a hoist
The starter motor’s wiring is disconnected at the starter motor
The starter is unbolted from its location at the flywheel, where the engine and transmission join
A new starter is fitted, then the mounting bolts are tightened to the proper torque
The wiring is refitted and the car is lowered to the ground
The battery is reconnected, then the ignition is turned to ensure proper operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (45, N'Spark Plug Cable Replacement', CAST(200 AS Decimal(18, 0)), 6, N'The technician matches a new spark plug cable to the old one while still on the car
The old spark plug cable is detached from the spark plug and the ignition coil using special spark plug cable pliers
The new cable is fitted in the same orientation as the old part
Any computer codes are cleared by the technician and the car is road tested to confirm the repair')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (46, N'Fuse Replacement', CAST(40 AS Decimal(18, 0)), 6, N'A technician confirms the symptom
The old fuse is removed from its location
The technician diagnoses the circuit, searching for a short to power or ground
Once the problem is repaired, a new fuse is installed in place
The technician tests the circuit’s operation to confirm the repair is complete')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (48, N'Power mirror switch replacement', CAST(50 AS Decimal(18, 0)), 6, N'Access the power mirror switch
Remove switch from the fixtures or panels
Unplug electrical connectors
Check new switch is the same as the old switch
Plug in electrical connectors
Refit switch to fixtures or panels
Test operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (49, N'Cooling System Flush', CAST(180 AS Decimal(18, 0)), 7, N'The mechanic will add a cooling system cleaner to the coolant, bring the car up to operating temperature to ensure the cleaner is evenly distributed throughout the whole system. The bottom radiator hose will then be removed to allow the coolant to be drained out. Once empty, the system will be flushed out with water from a hose to remove any remaining debris and cleaner and to check for blockages. The radiator hoses will be reinstalled, and a fresh mixture of coolant and distilled water will be added to the system.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (50, N'Coolant level sensor replacement', CAST(200 AS Decimal(18, 0)), 7, N'The coolant level sensor is verified as the problem
The coolant is drained lower than the coolant level sensor
The old coolant level sensor is disconnected and removed
The new coolant level sensor is connected and fitted
The coolant level is topped up, and the engine run to ensure correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (51, N'Water Pump Replacement', CAST(500 AS Decimal(18, 0)), 7, N'The cooling system is pressure tested and inspected for leaks
Remove components to allow access to the water pump
Remove and replace the water pump, and thermostat (if required)
Flush the cooling system to remove any debris
Refit components, and fill cooling system with new coolant
Bleed air out of cooling system
Test drive and re-inspect for any leaks')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (52, N'Radiator Replacement', CAST(500 AS Decimal(18, 0)), 7, N'The radiator will be inspected for leaks
If the radiator requires replacing, the coolant will be drained from the system
The cooling fans, radiator hoses and transmission hoses (automatic only) will be removed and secured out of the way
The old radiator will be removed from the vehicle
The cooling system will be flushed, to remove any debris
The new radiator will be installed, and the cooling fans, radiator hoses and transmission lines refitted
The radiator will be filled with new coolant and the system bled to remove any air
The vehicle will be road tested to ensure correct operation.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (53, N'Thermostat Replacement', CAST(180 AS Decimal(18, 0)), 7, N'The cooling system is drained and the technician locates the thermostat, typically on the engine by the upper radiator hose.
The thermostat housing is unbolted from the engine.
The failed thermostat is removed and a new one is installed in its place, noting the exact orientation of the old part.
The cooling system is refilled with coolant and the engine is run to operating temperature to confirm the repair.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (54, N'AC Compressor Replacement', CAST(900 AS Decimal(18, 0)), 7, N'The technician recovers the refrigerant in the whole AC system, discharging any pressure
The serpentine belt is removed from the AC compressor clutch pulley and the clutch is unplugged
The low-side and high-side refrigerant lines are disconnected from the compressor body
The failed compressor is unbolted and removed, and a new AC compressor fitted
The lines are refitted and the belt and wiring put back in place
The AC system is recharged with refrigerant according to manufacturer’s specifications
The technician confirms the AC system’s operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (55, N'Coolant Reservoir Replacement', CAST(200 AS Decimal(18, 0)), 7, N'The bonnet is lifted and the cooling system is inspected for leaks
If the coolant reservoir is damaged or leaking, or the sensor has failed, it needs to be changed
The cooling system is drained
The old coolant reservoir is discarded and a new one is installed
The cooling system is filled and bled of air
The technician runs the engine to operating temperature and road tests to confirm the repair')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (56, N'Battery replacement', CAST(190 AS Decimal(18, 0)), 8, N'Our mechanics will remove and replace your vehicle''s battery, including recycling your old battery and carry out a test on the charging system to make sure everything is in working order.

Battery cables will also be cleaned if required.')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (57, N'Battery cable replacement', CAST(200 AS Decimal(18, 0)), 8, N'Battery and system voltage is tested
Voltage drop is tested over the length of the battery cables
The corroded or damaged cable is replaced
The voltage test is carried out again to ensure repair is complete')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (58, N'Driveshaft Replacement', CAST(1000 AS Decimal(18, 0)), 9, N'The technician raises the car on a hoist
Obstructions including skid plates and heat shields are removed
The driveshaft is unbolted from the secured end at the wheel or differential
The slip yoke is removed from the transmission
A new driveshaft is installed in the reverse order, then skid plates and heat shields are refitted
The car is lowered and the technician performs a road test to confirm the repair')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (59, N'Transfer Case Fluid Replacement', CAST(110 AS Decimal(18, 0)), 9, N'The technician lifts the car in the air on a hoist or jacks
The skid plate is removed, if equipped
The transfer case oil drain plug is removed and the oil fully drained
The drain plug is inserted, then the fill plug is removed and clean fluid added
The fluid level is checked, then the fill plug tightened
The skid plate is refitted and the car lowered
The technician road tests the car to ensure proper working order')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (60, N'Differential Pinion Seal Replacement', CAST(270 AS Decimal(18, 0)), 9, N'The technician inspects the vehicle to find the source of the leak
The car is jacked up to allow access underneath
The rear of the driveshaft is unbolted from the differential
The pinion nut is marked and loosened, and the old seal removed
The area is cleaned and the new seal fitted
The driveshaft is reattached and the differential oil is checked and topped up
The vehicle is lowered down and test driven to ensure correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (61, N'Manual Selector Cable replacement', CAST(400 AS Decimal(18, 0)), 9, N'The technician will identify the issue
The centre console and gear selector will be removed to allow access to the cables
The cables will be disconnected from inside the car
The technician will move into the engine bay, removing covers off the transmission to allow access to
The cable mounting points
The cables will be disconnected from the transmission and removed
The new cables will be attached to the transmission and passed through into the cabin of the vehicle
The new cables will be attached to the gear selector and the centre console refitted
The cables will be adjusted as needed
The vehicle will be tested to ensure correct operation')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (62, N'Transmission Mount Replacement', CAST(350 AS Decimal(18, 0)), 9, N'On rear-wheel-drive cars, the technician lifts the car on a hoist or jack stands
Skid plates or heat shields are removed to allow access to the transmission mount
The broken mount is unbolted and removed and a new mount is fitted
On front-wheel-drive and AWD cars, the technician often works on the car on the floor
From the top, a path is cleared to the transmission mount, often requiring air cleaner box removal, disconnecting wiring, moving hoses
The broken transmission mount is removed and a new one fitted
The engine bay is reassembled as it was
In both situations, the technician road tests to confirm the symptom has been corrected')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (63, N'Shift Lock Solenoid Replacement', CAST(140 AS Decimal(18, 0)), 9, N'The shift lock solenoid is usually situated near the transmission lever. The technician will need to remove the centre console panel from around the shift lever to access the component
Once located, the shift lock solenoid will be removed
New shift lock solenoid will be fitted
The circuit will be checked and tested
Centre console panel will be fixed back into place
The transmission lever operation will be checked')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (76, N'Maintenance Basic', CAST(148 AS Decimal(18, 0)), 10, N'Replace engine oil up to 4.5L standard oil. Replace engine oil filter up to $20.Check and set tyre pressures. Lubricate doors and chassis')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (77, N'Maintenance Standard', CAST(189 AS Decimal(18, 0)), 10, N'Replace engine oil up to 4.5L standard oil. Replace engine oil filter up to $20. Check and top-up under bonnet fluids. Check and set tyre pressures. 33 point comprehensive visual inspection Checking: Fluids, under bonnet, under vehicle, brakes and tyres')
INSERT [dbo].[service] ([id], [service_name], [service_cost], [service_category], [service_description]) VALUES (78, N'Maintenance Premium', CAST(229 AS Decimal(18, 0)), 10, N'Replace engine oil up to 4.5L standard oil. Replace engine oil filter up to $20. Reset service/maintenance light. Perform engine management system scan. 33 point comprehensive visual inspection Checking: Fluids, under bonnet, under vehicle, brakes and tyres.')
SET IDENTITY_INSERT [dbo].[service] OFF
SET IDENTITY_INSERT [dbo].[service_category] ON 

INSERT [dbo].[service_category] ([id], [name]) VALUES (1, N'Windscreens')
INSERT [dbo].[service_category] ([id], [name]) VALUES (2, N'Brakes')
INSERT [dbo].[service_category] ([id], [name]) VALUES (3, N'Clutch')
INSERT [dbo].[service_category] ([id], [name]) VALUES (4, N'Air Conditioning')
INSERT [dbo].[service_category] ([id], [name]) VALUES (5, N'Suspension and Steering')
INSERT [dbo].[service_category] ([id], [name]) VALUES (6, N'Auto Electrician')
INSERT [dbo].[service_category] ([id], [name]) VALUES (7, N'Radiator Repairs')
INSERT [dbo].[service_category] ([id], [name]) VALUES (8, N'Car Battery')
INSERT [dbo].[service_category] ([id], [name]) VALUES (9, N'Transmission')
INSERT [dbo].[service_category] ([id], [name]) VALUES (10, N'Maintenance')
SET IDENTITY_INSERT [dbo].[service_category] OFF
SET IDENTITY_INSERT [dbo].[service_image] ON 

INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (1, 1, N'windscreen-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (2, 5, N'side-window-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (3, 6, N'windscreen-chip-repair.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (4, 7, N'rear-window-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (5, 8, N'front-brake-part-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (6, 9, N'abs-wheel-speed-sensor.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (7, 10, N'front-brake-part-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (8, 11, N'rear-brake-part-repls.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (9, 12, N'rear-brake-pad-rotor-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (10, 13, N'brake-system-flush.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (11, 14, N'brake-caliper-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (12, 15, N'brake-light-bulb-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (13, 16, N'brake-drum-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (14, 17, N'brake-hose-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (15, 18, N'clutch-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (16, 19, N'clutch-fluid-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (17, 20, N'clutch-master-cylinder.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (18, 21, N'clutch-cable-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (19, 22, N'clutch-cable-adjustment.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (20, 23, N'air-conditioner-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (21, 24, N'car-aircon-condenser.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (22, 25, N'image_ac-regas.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (23, 26, N'blower-motor-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (24, 27, N'high-pressure-hose-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (25, 28, N'switch-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (26, 29, N'wheel-bearings.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (27, 30, N'steering-column-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (28, 31, N'front-shock-absorber-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (29, 32, N'front-shock-absorber-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (30, 33, N'cv-boot-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (31, 34, N'suspension-bush.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (32, 35, N'power-steering-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (33, 36, N'cv-shaft-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (34, 37, N'power-steering-fluid.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (35, 38, N'power-steering-rack-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (36, 39, N'headlight-bulb.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (37, 40, N'horn-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (38, 41, N'throttle-position-sensor-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (39, 42, N'alternator-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (40, 43, N'ignition-coil-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (41, 44, N'starter-motor-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (42, 45, N'spark-plugs-cable-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (43, 46, N'fuse-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (44, 48, N'power-mirror-switch-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (45, 49, N'cooling-system-flush.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (46, 50, N'coolant-level-sensor-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (47, 51, N'water-pump-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (48, 52, N'radiator-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (49, 53, N'thermostat-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (50, 54, N'ac-compressor-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (51, 55, N'coolant-reservoir-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (52, 56, N'battery-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (53, 57, N'battery-cable-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (54, 58, N'driveshaft-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (55, 59, N'transfer-fluid-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (56, 60, N'differential-pinion-seal-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (57, 61, N'manual-selector-cable-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (58, 62, N'transmission-mount-replacement.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (59, 63, N'shift-lock-solenoid-repl.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (61, 72, N'hamburger.png')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (62, 73, N'')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (63, 74, N'')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (64, 75, N'')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (65, 76, N'car_maintenance.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (66, 77, N'car_maintenance.jpg')
INSERT [dbo].[service_image] ([id], [service_id], [image_path]) VALUES (67, 78, N'car_maintenance.jpg')
SET IDENTITY_INSERT [dbo].[service_image] OFF
SET IDENTITY_INSERT [dbo].[user_stat] ON 

INSERT [dbo].[user_stat] ([id], [user_id], [login_date]) VALUES (1, 2, CAST(N'2019-08-09' AS Date))
INSERT [dbo].[user_stat] ([id], [user_id], [login_date]) VALUES (2, 2, CAST(N'2019-08-10' AS Date))
INSERT [dbo].[user_stat] ([id], [user_id], [login_date]) VALUES (3, 2, CAST(N'2019-08-11' AS Date))
INSERT [dbo].[user_stat] ([id], [user_id], [login_date]) VALUES (4, 2, CAST(N'2019-08-14' AS Date))
INSERT [dbo].[user_stat] ([id], [user_id], [login_date]) VALUES (5, 2, CAST(N'2019-08-16' AS Date))
SET IDENTITY_INSERT [dbo].[user_stat] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [user_name], [email], [password], [usession], [active], [isAdmin]) VALUES (2, N'alex', N'alba632@ess.ais.ac.nz', N'0hmxtM5BUJITi+LETru+BuFOJUS3wsSdxjZOmTxI2H+B/Fi8jsZxDxEJPCR4AKKLM5MXxH1Qqk5tATNYEbEGlA==', N'dvi/pLBwRTf7vY/uuc2oytw/9Xx4t/kVLRj4+ody2HGdw6gVo7bs9Y+nfmPYMPu6UPdT5E7Rl7VmnGSBj2iqaQ==', 1, 1)
INSERT [dbo].[users] ([id], [user_name], [email], [password], [usession], [active], [isAdmin]) VALUES (3, N'user', N'user@eml.em', N'zUiQNKiGSoineU9dNAlSzWPFv5UFnvrncuK3h3mYsgukfbe7qhoFxqABQg1CNYyLDJTCw1dSkqzhOyqYZPzVew==', N'ItnTXhtYRZODafluAsLGtwhb02zNdFMptonSsAfDlfhGSIdzEYxdLBDDeAIi6okAN0ZwzvYtfcyXgKCWUkE6pA==', 1, 0)
INSERT [dbo].[users] ([id], [user_name], [email], [password], [usession], [active], [isAdmin]) VALUES (6, N'admin', N'admin@aisemail.adm', N'GKMV1YpmBUGhv95xlLcCq4RCbCzitwGQ7xuEdzQSZEAtqgv+gNkWRCzQW6MQ+U/mz2rfWmGZ9gYvgy0sRQojLg==', N'NcsLwPnPWFkZ83y9xFQ/IbitfyWrAQXstVThk+wvHDlon9CK6GKpIRabdFcEC5+zHldB9zKpKPrvi4EtnIHkIw==', 1, 1)
SET IDENTITY_INSERT [dbo].[users] OFF
SET IDENTITY_INSERT [dbo].[visit_service] ON 

INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (1, 57, 8)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (2, 57, 9)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (3, 20, 9)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (4, 41, 9)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (5, 44, 9)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (6, 52, 9)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (7, 50, 9)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (8, 52, 9)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (9, 60, 9)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (10, 62, 9)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (11, 57, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (12, 20, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (13, 41, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (14, 44, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (15, 52, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (16, 50, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (17, 52, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (18, 60, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (19, 62, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (20, 24, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (21, 25, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (22, 53, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (23, 20, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (24, 42, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (25, 20, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (26, 50, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (27, 63, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (28, 19, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (29, 18, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (30, 43, 10)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (31, 57, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (32, 20, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (33, 41, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (34, 44, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (35, 52, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (36, 50, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (37, 52, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (38, 60, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (39, 62, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (40, 24, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (41, 25, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (42, 53, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (43, 20, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (44, 42, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (45, 20, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (46, 50, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (47, 63, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (48, 19, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (49, 18, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (50, 43, 11)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (51, 57, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (52, 20, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (53, 41, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (54, 44, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (55, 52, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (56, 50, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (57, 52, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (58, 60, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (59, 62, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (60, 24, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (61, 25, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (62, 53, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (63, 20, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (64, 42, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (65, 20, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (66, 50, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (67, 63, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (68, 19, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (69, 18, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (70, 43, 12)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (71, 27, 13)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (72, 56, 13)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (73, 24, 13)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (74, 59, 13)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (75, 10, 13)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (76, 5, 18)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (77, 21, 18)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (78, 57, 18)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (79, 76, 18)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (80, 77, 18)
INSERT [dbo].[visit_service] ([id], [service_id], [visit_id]) VALUES (81, 78, 18)
SET IDENTITY_INSERT [dbo].[visit_service] OFF
