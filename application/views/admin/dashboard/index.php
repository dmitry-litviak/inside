<div class="dashboard_edit">
        <h3>Dashboard edit</h3>
        <table class="table table-bordered table-striped">
                <tbody>
                    <?php foreach ($feeds as $feed): ?>
                        <tr>
                                <td><?php echo $feed['icon'] ?></td>
                                <td><strong><?php echo $feed['name'] ?></strong> <?php echo $feed['text'] ?> <span class="label <?php echo Helper_Dashboard::getBadgeClass($feed['type']) ?>"><?php echo $feed['info'] ?></span></td>
                                <td><span class="btn btn-mini remove" data-id="<?php echo $feed['id'] ?>">remove</span></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
        </table>
</div>