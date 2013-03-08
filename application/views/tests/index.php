<div class="about-certifitations">
        <p>Brainbench is one of the most popular tests. For Senior Developer your grade should be more than 4.00. Company will pay for test and for posting.</p>
        <h3>Brainbench</h3>
        <table class="table table-bordered table-striped" >
                <tbody>
                    <?php foreach ($certificates as $key => $certificate): ?>
                        <?php if (!empty($certificate)): ?>
                            <th colspan="2" style="text-align: center"><?php echo $key ?></th>
                        <?php endif; ?>
                        <?php foreach ($certificate as $value): ?>
                            <tr>
                                    <td><?php echo $value['first_name'] . ' ' . $value['last_name'] ?></td>
                                    <td><?php echo $value['score'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endforeach; ?>
                </tbody>
        </table>
</div>