			<div class="dashboard">
				<div class="filter">
					<ul class="nav nav-pills nav-pills-left feed">
						<li class="active" id="all_feed"><a href="#">All</a></li>
						<li id="brainbench"><a href="#" >Brainbench</a></li>
						<li id="internal"><a href="#">Internal</a></li>
						<li id="enhance"><a href="#">Enhance</a></li>
					</ul>
					<ul class="nav nav-pills nav-pills-right pr">
						<li class="active" id="all_pr" data-id="all_pr" ><a href="#">All</a></li>
						<li id="mobile" data-id="2"><a href="#" >Mobile</a></li>
						<li id="web" data-id="1"><a href="#" >Web</a></li>
					</ul>
				</div>
				<h3>Dashboard</h3>
				<table class="table table-bordered table-striped">
					<tbody>
                                            <?php foreach ($feeds as $feed): ?>
                                                <tr>
                                                    <td><?php echo $feed['icon'] ?></td>
                                                    <td><strong><?php echo $feed['name'] ?></strong> <?php echo $feed['text'] ?> <span class="label <?php echo Helper_Dashboard::getBadgeClass($feed['type']) ?>"><?php echo $feed['info'] ?></span></td>
                                                </tr>
                                            <?php endforeach; ?>
					</tbody>
				</table>
			</div>