---
title: University Group Project
image: /2009/03/16/university-group-project@256x256.webp
tags: [blog, webdev]
layout: layout-post
---

<figure>
 <img
  src="/2009/03/16/university-group-project@256x256.webp"
  alt="Safari screenshot showing a webpage loaded on localhost with a placeholder avatar for a Dr. Ravi on the left and a list of appointments for Thursday 12th March on the right. The patients are all named after pro skaters such as Tony Hawk and Danny Way, and the illnesses are Theme Hospital illnesses such as bloaty head and invisibility."
 >
</figure>

A bunch of us built a medical appointment scheduling app together at university.
It's some of the oldest code I wrote that I still have a copy of. For
nostalgia's sake, here's the contents of `doctor.php` as seen in the address bar
above.

```php
//include 'includes/common.php';

$doctorID = $user->getDoctorID();

$date     = isset($_GET['date']) ? $_GET['date'] : DEBUG_DATE;

$res1 = $dbs->query(
	'SELECT
		Users.lastName
	FROM
		Doctors,
		Users
	WHERE
		Doctors.userID = Users.userID
		AND Doctors.doctorID = %d',
	$doctorID
);

$row = $res1->getNextRow();
$doctorName = $row['lastName'];
$page->addData('doctorName', $doctorName);

$res2 = $dbs->query(
	'SELECT
		Appointments.appointmentID,
		Appointments.appointmentType,
		Appointments.appointmentDate,
		Users.firstName,
		Users.lastName
	FROM
		Doctors,
		Appointments,
		Patients,
		Users
	WHERE
		Doctors.doctorID = Appointments.doctorID
		AND Appointments.patientID = Patients.patientID
		AND Patients.userID = Users.userID
		AND Doctors.doctorID = %d
		AND appointmentDate LIKE \'%s%%\'
	ORDER BY
		Appointments.appointmentDate
		ASC',
	$doctorID,
	$date
);



$apps = array();
while ($res2->hasNextRow()) {
	$row = $res2->getNextRow();

	$time  = substr($row['appointmentDate'], 11, 5);
	$name  = $row['firstName'] .' '. $row['lastName'];
	$appID = $row['appointmentID'];
	$type  = $row['appointmentType'];

	$apps[$time] = array(
		'id'   => $appID,
		'name' => $name,
		'type' => $type,
	);
}

$tstamp = datetimeToTimestamp($date);

$page->addData('doctorID', $doctorID);
$page->addData('hours', array('09', '10', '11', '12', '13'));
$page->addData('minutes', array('00', '15', '30', '45'));

$page->addData('viewDate', date(NICE_DATE_FORMAT, $tstamp));
$page->addData('tomorrow', date('Y-m-d', $tstamp + (60 * 60 * 24)));
$page->addData('yesterday', date('Y-m-d', $tstamp - (60 * 60 * 24)));

$page->addData('appointments', $apps);
```
